#!/bin/bash
set -x
BUILD_TYPE=Release
BUILD_DIR=./build_mips
PREFIX=/data/ruff/forTope/openwrt_21
CMAKE_SYSROOT=${PREFIX}/staging_dir/target-mipsel_24kc_musl
CC=${PREFIX}/staging_dir/toolchain-mipsel_24kc_gcc-8.4.0_musl/bin/mipsel-openwrt-linux-musl-gcc
CXX=${PREFIX}/staging_dir/toolchain-mipsel_24kc_gcc-8.4.0_musl/bin/mipsel-openwrt-linux-musl-g++
rm -fr ${BUILD_DIR}
mkdir -p ${BUILD_DIR}
USE_EXTERNAL_FFI=ON CMAKE_SYSROOT=${CMAKE_SYSROOT} CC=${CC} CXX=${CXX} cmake -DCMAKE_C_LINK_FLAGS="${CMAKE_C_LINK_FLAGS} -latomic" -DCMAKE_C_FLAGS="${CMAKE_C_FLAGS} -rdynamic" -B ${BUILD_DIR} -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
cmake --build ${BUILD_DIR} -j 32
