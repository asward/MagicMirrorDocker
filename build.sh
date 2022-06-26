#!/bin/bash
set -e
latest_release=$(git ls-remote --tags --refs --sort="v:refname" https://github.com/MichMich/MagicMirror.git | tail -n1 | sed 's/.*\///')

docker buildx build --progress plain ${1} --build-arg branch="${latest_release}" -t ward/docker-magicmirror:"${latest_release}" -t ward/docker-magicmirror:latest .

# # https://stackoverflow.com/a/51761312/4934537
# if [ "$(docker manifest inspect bastilimbach/docker-magicmirror:"${latest_release}" > /dev/null; echo $?)" != 0 ]; then
#   docker buildx build --progress plain --platform=linux/amd64,linux/arm64,linux/arm/v7 ${1} --build-arg branch="${latest_release}" -t ward/docker-magicmirror:"${latest_release}" -t ward/docker-magicmirror:latest .
# fi

# docker buildx build --progress plain --platform=linux/amd64,linux/arm64,linux/arm/v7 ${1} --build-arg branch=develop -t bastilimbach/docker-magicmirror:develop .
