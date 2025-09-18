# Copyright (c) 2019-2022, NVIDIA CORPORATION.

import os

import versioneer
from setuptools import find_packages
from skbuild import setup


if "MXMAP_PY_WHEEL_VERSIONEER_OVERRIDE" in os.environ:
    orig_get_versions = versioneer.get_versions

    version_override = os.environ["MXMAP_PY_WHEEL_VERSIONEER_OVERRIDE"]

    def get_versions():
        data = orig_get_versions()
        data["version"] = version_override
        return data

    versioneer.get_versions = get_versions

setup(
    name="rmmx" + os.getenv("MXMAP_PY_WHEEL_SUFFIX", default=""),
    version=versioneer.get_version(),
    # version=23.02,
    description="rmmx - Memory Manager Extender",
    # url="https://xxx",
    author="HGPU Corporation",
    license="Apache 2.0",
    classifiers=[
        "Intended Audience :: Developers",
        "Topic :: Database",
        "Topic :: Scientific/Engineering",
        "License :: OSI Approved :: Apache Software License",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
    ],
    # Include the separately-compiled shared library
    extras_require={"test": ["pytest"]},
    packages=find_packages(include=["rmmx", "rmmx.*"]),
    include_package_data=True,
    python_requires=">=3.8",
    package_data={
        # Note: A dict comprehension with an explicit copy is necessary (rather
        # than something simpler like a dict.fromkeys) because otherwise every
        # package will refer to the same list and skbuild modifies it in place.
        key: ["*.hpp", "*.pxd"]
        for key in find_packages(
            include=["rmmx._lib", "rmmx._lib.includes", "rmmx._cuda*"]
        )
    },
    cmdclass=versioneer.get_cmdclass(),
    install_requires=[
        "numpy>=1.19",
        "numbax",
    ],
    zip_safe=False,
)
