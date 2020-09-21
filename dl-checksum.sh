#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/openfaas/faas-cli/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local file=$4
    local suffix=${5:-}
    local platform="${os}-${arch}"
    local url=$MIRROR/$ver/$file$suffix.sha256
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(curl -SsL $url | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver linux amd64 faas-cli
    dl $ver linux arm64 faas-cli-arm64
    dl $ver linux armhf faas-cli-armhf
    dl $ver darwin darwin faas-cli-darwin
    dl $ver windows amd64 faas-cli .exe
}

dl_ver ${1:-0.12.13}
