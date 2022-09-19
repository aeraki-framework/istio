## Copyright Aeraki Authors
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.

ifeq (${AERAKI_ENVOY_VERSION},)
  export AERAKI_ENVOY_VERSION:=${shell cat aeraki.deps}
endif

ifeq (${AERAKI_ENVOY_DEBUG},"true")
  export AERAKI_ENVOY_TAR_BALL=meta-protocol-proxy-debug-${AERAKI_ENVOY_VERSION}.tar.gz
else
  export AERAKI_ENVOY_TAR_BALL=meta-protocol-proxy-${AERAKI_ENVOY_VERSION}.tar.gz
endif

export AERAKI_ENVOY_RELEASE_URL = https://github.com/aeraki-framework/meta-protocol-proxy/releases/download/${AERAKI_ENVOY_VERSION}/${AERAKI_ENVOY_TAR_BALL}

export ISTIO_ENVOY_LINUX_RELEASE_DIR = ${TARGET_OUT_LINUX}/release
export AERAKI_ENVOY_LINUX_RELEASE_NAME = meta-protocol-proxy-${AERAKI_ENVOY_VERSION}
export AERAKI_ENVOY_LINUX_RELEASE_PATH = ${ISTIO_ENVOY_LINUX_RELEASE_DIR}/${AERAKI_ENVOY_LINUX_RELEASE_NAME}
