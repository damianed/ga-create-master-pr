#!/bin/bash

currentDate=$(date +'%B %d, %Y')

body=$(jq -r . "$GITHUB_EVENT_PATH")
echo ${currentDate}
echo ${GITHUB_REPOSITORY} 
curl -sSL \
  -X POST \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  -d "{\"title\":\"Live Push: ${currentDate}\",\"head\":\"develop\",\"base\":\"master\", \"body\": \"body\"}" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/pulls"
