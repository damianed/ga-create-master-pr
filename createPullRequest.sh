#!/bin/bash

currentDate=$(date +'%B %d, %Y')

curl -sSL \
  -X POST \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  -d "{\"title\":\"Live Push: ${currentDate}\",\"head\":\"develop\",\"base\":\"master\"}" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/pulls"
