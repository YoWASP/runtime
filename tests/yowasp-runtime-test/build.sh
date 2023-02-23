#!/bin/sh -e

cd $(dirname $0)

WASI_SDK=wasi-sdk-11.0
WASI_SDK_URL=https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-11/wasi-sdk-11.0-linux.tar.gz
if ! [ -d ${WASI_SDK} ]; then curl -L ${WASI_SDK_URL} | tar xzf -; fi
WASI_SDK_PATH=$(readlink -f ${WASI_SDK})

${WASI_SDK_PATH}/bin/clang --sysroot ${WASI_SDK_PATH}/share/wasi-sysroot \
	-o yowasp_runtime_test/cat.wasm cat.c
