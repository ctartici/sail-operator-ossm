#!/bin/bash

# Copyright Istio Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -euo pipefail

VERSIONS_YAML_FILE=${VERSIONS_YAML_FILE:-"versions.yaml"}
VERSIONS_YAML_DIR=${VERSIONS_YAML_DIR:-"pkg/istioversion"}

function removeOldVersions() {
    versions=$(yq eval '.versions[] | select(.ref == null) | select(.eol != true) | .name' "${VERSIONS_YAML_DIR}/${VERSIONS_YAML_FILE}" | tr $'\n' ' ')
    for subdirectory in resources/*/; do
        version=$(basename "$subdirectory")
        if [[ ! " ${versions} " == *" $version "* ]]; then
            echo "Removing: $subdirectory"
            rm -r "$subdirectory"
        fi
    done
}

removeOldVersions
