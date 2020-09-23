FROM alpine:3.10.3

LABEL "com.github.actions.name"="GA-CreateMasterPR"
LABEL "com.github.actions.description"="Creates pull request to master"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="blue"

LABEL version="0.0.1"

RUN apk add --no-cache bash curl jq && rm -rf /var/lib/apt/lists/*

COPY "createPullRequest.sh" "/createPullRequest.sh"
RUN chmod +x /createPullRequest.sh
ENTRYPOINT ["/createPullRequest.sh"]
