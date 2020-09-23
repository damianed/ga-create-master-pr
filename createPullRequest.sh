#!/bin/bash

currentDate=$(date +'%B %d, %Y')

echo "${GITHUB_EVENT_PATH}"
body=$(jq -r ".after.commits[].message" "${GITHUB_EVENT_PATH}")
echo ${GITHUB_REPOSITORY} 
curl -sSL \
  -X POST \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  -d "{\"title\":\"Live Push: ${currentDate}\",\"head\":\"develop\",\"base\":\"master\", \"body\": \"Develop PR: ${body}\"}" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/pulls"
