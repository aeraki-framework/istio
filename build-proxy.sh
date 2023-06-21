#!/bin/bash

#export AERAKI_ENVOY_DEBUG=false
#export AERAKI_ENVOY_DEBUG=true
#export DOCKER_BUILD_VARIANTS=default
#export DOCKER_BUILD_VARIANTS=distroless

rm -rf out/
export BUILD_WITH_CONTAINER=0;make docker.proxyv2

export ENVOY_TAG=`git rev-parse HEAD`
export AERAKI_ENVOY_VERSION=`cat aeraki.deps`

if [ "${AERAKI_ENVOY_DEBUG}" == "true" ]; then
  export AERAKI_ENVOY_IMAGE=ghcr.io/aeraki-mesh/meta-protocol-proxy-debug:${AERAKI_ENVOY_VERSION}
else
  export AERAKI_ENVOY_IMAGE=ghcr.io/aeraki-mesh/meta-protocol-proxy:${AERAKI_ENVOY_VERSION}
fi

echo $AERAKI_ENVOY_IMAGE

if [ "${DOCKER_BUILD_VARIANTS}" == "distroless" ]; then
  export AERAKI_ENVOY_IMAGE=ghcr.io/aeraki-mesh/meta-protocol-proxy-distroless:${AERAKI_ENVOY_VERSION}
  docker tag docker.io/istio/proxyv2:${ENVOY_TAG}-distroless ${AERAKI_ENVOY_IMAGE}
else
  docker tag docker.io/istio/proxyv2:${ENVOY_TAG} ${AERAKI_ENVOY_IMAGE}
fi
  docker push ${AERAKI_ENVOY_IMAGE}
