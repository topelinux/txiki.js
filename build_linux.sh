#!/bin/bash
set -x
BUILD_TYPE=Release
BUILD_DIR=./build_linux
rm -fr ${BUILD_DIR}
mkdir -p ${BUILD_DIR}
PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/opt/ruff/lib/pkgconfig/ cmake -DCMAKE_C_LINK_FLAGS="${CMAKE_C_LINK_FLAGS} -latomic" -DCMAKE_C_FLAGS="${CMAKE_C_FLAGS} -rdynamic" -B ${BUILD_DIR} -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
cmake --build ${BUILD_DIR} -j 32
