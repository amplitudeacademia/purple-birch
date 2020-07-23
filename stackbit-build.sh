#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.netlify.com/build_hooks/5f190d25d26a8e316dfdf0f2 > /dev/null
gatsby build
./inject-netlify-identity-widget.js public
curl -s -X POST https://api.netlify.com/build_hooks/5f190d25d26a8e316dfdf0f2 > /dev/null
