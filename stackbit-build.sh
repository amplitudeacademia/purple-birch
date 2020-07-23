#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.netlify.com/build_hooks/5f190d25d26a8e316dfdf0f2 > /dev/null
if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.netlify.com/build_hooks/5f190d25d26a8e316dfdf0f2 
fi
curl -s -X POST https://api.netlify.com/build_hooks/5f190d25d26a8e316dfdf0f2 > /dev/null
gatsby build
./inject-netlify-identity-widget.js public
curl -s -X POST https://api.netlify.com/build_hooks/5f190d25d26a8e316dfdf0f2 > /dev/null
