#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/openfaas/faas-cli/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="${os}-${arch}"
    local suffix=""
    if [ "$os" = "windows" ];
    then
        suffix=".exe"
    elif [ "$os" = "darwin" ];
    then
        suffix="-${os}"
    elif [ "$arch" != "amd64" ];
    then
        suffix="-${arch}"
    fi

    local url=$MIRROR/$ver/faas-cli$suffix.sha256
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(curl -SsLf $url | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver linux armhf
    dl $ver darwin amd64
    dl $ver windows amd64
}

dl_ver ${1:-0.15.4}
