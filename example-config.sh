#!/bin/bash -eu

# Variables always required
export GITHUB_CLIENT_ID=# <GitHub OAuth App Client ID>
export GITHUB_CLIENT_SECRET=# <GitHub OAuth App Client Secret>
export COGNITO_REDIRECT_URI=# https://<Your Cognito Domain>/oauth2/idpresponse
# Change these if used with GitHub Enterprise (see below)
export GITHUB_API_URL=https://api.github.com
export GITHUB_LOGIN_URL=https://github.com


export PORT=9000
