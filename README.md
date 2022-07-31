# Authentication and authorization 

This is a simple authentication and authorization bakend for MCRC application. 

Authentication is done by AWS Cognito with Github integration.

To integrate AWS Cognito with Gtihub we need to deploy OIDC connector application and to need to provide that OIDC 
connector endpoints details to AWS Cognito.

## OIDC Connector

**Endpoints for AWS Cognito**

    * **Authorization Endpoint**: https://github.com/login/oauth/authorize
    * **Login URL**: https://<your-oidc-connector-url>/github/login-url [Local development only]
    * **Token Endpoint**: https://<your-oidc-connector-url>/github/token
    * **User Info Endpoint**: https://<your-oidc-connector-url>/github/userinfo
    * **JWKS Endpoint**: https://<your-oidc-connector-url>/jwks
    
## Local development

To develope this backend locally you need to install the following packages:

```bash

bundle install

```

Create following environment variables:

```bash
#!/bin/bash -eu

# Variables always required
GITHUB_CLIENT_ID=# <GitHub OAuth App Client ID>
GITHUB_CLIENT_SECRET=# <GitHub OAuth App Client Secret>
COGNITO_REDIRECT_URI=# https://<Your Cognito Domain>/oauth2/idpresponse
# Change these if used with GitHub Enterprise (see below)
GITHUB_API_URL=https://api.github.com
GITHUB_LOGIN_URL=https://github.com

export PORT=9000

# To enable ngrok for local development
RAILS_DEVELOPMENT_HOSTS = <ngrok url>
```

Crate a copy for `example-config.sh` file

```bash
cp example-config.sh config.sh
# Edit config.sh file
soruce config.sh
```


