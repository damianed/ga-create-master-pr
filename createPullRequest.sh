#!/bin/bash

currentDate=$(date +'%B %d, %Y')

body=$(jq -r after.commits.0.message "$GITHUB_EVENT_PATH")
echo ${GITHUB_REPOSITORY} 
curl -sSL \
  -X POST \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  -d "{\"title\":\"Live Push: ${currentDate}\",\"head\":\"develop\",\"base\":\"master\", \"body\": \"Develop PR: ${body}\"}" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/pulls"
