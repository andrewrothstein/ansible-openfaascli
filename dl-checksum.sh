#!/usr/bin/env sh
VER=0.9.2
DIR=~/Downloads
MIRROR=https://github.com/openfaas/faas-cli/releases/download/${VER}

dl()
{
    OS=$1
    ARCH=$2
    FILENAME=$3
    SUFFIX=${4:-}
    URL=$MIRROR/${FILENAME}${SUFFIX}.sha256
    printf "    # %s\n" $URL
    printf "    %s-%s: sha256:%s\n" $OS $ARCH $(curl -SsL $URL | awk '{print $1}')
}

printf "  '%s':\n" $VER
dl linux amd64 faas-cli
dl linux arm64 faas-cli-arm64
dl linux armhf faas-cli-armhf
dl darwin darwin faas-cli-darwin
dl windows amd64 faas-cli .exe
