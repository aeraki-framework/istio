#!/bin/bash

rm -rf out/
export BUILD_WITH_CONTAINER=0;make docker.proxyv2

export AERAKI_ENVOY_VERSION=`cat aeraki.deps`
if [ "${AERAKI_ENVOY_DEBUG}" == "true" ]; then
  export AERAKI_ENVOY_IMAGE=aeraki/meta-protocol-proxy-debug:${AERAKI_ENVOY_VERSION}
  echo $AERAKI_ENVOY_IMAGE
else
  export AERAKI_ENVOY_IMAGE=aeraki/meta-protocol-proxy:${AERAKI_ENVOY_VERSION}
fi
if [ "${DOCKER_BUILD_VARIANTS}" == "distroless" ]; then
  export AERAKI_ENVOY_IMAGE=aeraki/meta-protocol-proxy-distroless:${AERAKI_ENVOY_VERSION}
  docker tag docker.io/aeraki/proxyv2:1.1.0-distroless ${AERAKI_ENVOY_IMAGE}
else
  docker tag docker.io/aeraki/proxyv2:1.1.0 ${AERAKI_ENVOY_IMAGE}
fi
  docker push ${AERAKI_ENVOY_IMAGE}
