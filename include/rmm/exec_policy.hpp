/*
 * 2025 - Modified by MetaX Integrated Circuits (Shanghai) Co., Ltd. All Rights Reserved.
 */


/*
 * Copyright (c) 2020-2021, NVIDIA CORPORATION.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 @file exec_policy.hpp
 Thrust execution policy that uses RMM's Thrust Allocator Adaptor.
 */

#pragma once

#include <rmm/cuda_stream_view.hpp>
#include <rmm/mr/device/thrust_allocator_adaptor.hpp>

#include <rmm/detail/thrust_namespace.h>
#ifdef MGPU_BUILD
#include <thrust/system/mc/execution_policy.h>
#else
#include <thrust/system/cuda/execution_policy.h>
#endif
#include <thrust/version.h>

namespace rmm {

#ifdef MGPU_BUILD
using thrust_exec_policy_t =
  thrust::detail::execute_with_allocator<rmm::mr::thrust_allocator<char>,
                                         thrust::mc_cub::execute_on_stream_base>;
#else
using thrust_exec_policy_t =
  thrust::detail::execute_with_allocator<rmm::mr::thrust_allocator<char>,
                                         thrust::cuda_cub::execute_on_stream_base>;
#endif

/**
 * @brief Helper class usable as a Thrust CUDA execution policy
 * that uses RMM for temporary memory allocation on the specified stream.
 */
class exec_policy : public thrust_exec_policy_t {
 public:
  explicit exec_policy(cuda_stream_view stream             = cuda_stream_default,
                       rmm::mr::device_memory_resource* mr = mr::get_current_device_resource())
    : thrust_exec_policy_t(
#ifdef MGPU_BUILD
        thrust::mc::par(rmm::mr::thrust_allocator<char>(stream, mr)).on(stream.value()))
#else
        thrust::cuda::par(rmm::mr::thrust_allocator<char>(stream, mr)).on(stream.value()))
#endif
  {
  }
};

#if THRUST_VERSION >= 101600

using thrust_exec_policy_nosync_t =
  thrust::detail::execute_with_allocator<rmm::mr::thrust_allocator<char>,
#ifdef MGPU_BUILD
                                         thrust::mc_cub::execute_on_stream_nosync_base>;
#else
                                         thrust::cuda_cub::execute_on_stream_nosync_base>;
#endif
/**
 * @brief Helper class usable as a Thrust CUDA execution policy
 * that uses RMM for temporary memory allocation on the specified stream
 * and which allows the Thrust backend to skip stream synchronizations that
 * are not required for correctness.
 */
class exec_policy_nosync : public thrust_exec_policy_nosync_t {
 public:
  explicit exec_policy_nosync(
    cuda_stream_view stream             = cuda_stream_default,
    rmm::mr::device_memory_resource* mr = mr::get_current_device_resource())
    : thrust_exec_policy_nosync_t(
#ifdef MGPU_BUILD
        thrust::mc::par_nosync(rmm::mr::thrust_allocator<char>(stream, mr)).on(stream.value()))
#else
        thrust::cuda::par_nosync(rmm::mr::thrust_allocator<char>(stream, mr)).on(stream.value()))
#endif
  {
  }
};

#else

using thrust_exec_policy_nosync_t = thrust_exec_policy_t;
using exec_policy_nosync          = exec_policy;

#endif

}  // namespace rmm
