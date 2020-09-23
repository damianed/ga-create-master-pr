#!/bin/bash

currentDate=$(date +'%B %d, %Y')

body=$(jq -r . "$GITHUB_EVENT_PATH")
echo "$body"
curl -sSL \
  -X POST \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  --data-urlencode "{\"title\":\"Live Push: ${currentDate}\",\"head\":\"develop\",\"base\":\"master\", \"body\": \"body\"}" \
  "https://api.github.com/repos/justia/${GITHUB_REPOSITORY}/pulls"
