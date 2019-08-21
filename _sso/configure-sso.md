---
title: Configure SSO
position: 1
description: Create or update SSO configuration in the CloudHealth Platform.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/sso/configure
parameters:
  - name: client_api_id
    required: no
    content: String that specifies the unique customer API Key that CloudHealth generates. See [How to Get Client API ID](#partner_how-to-get-client-api-id).
  - name: sso_provider
    required: yes
    content: String that specifies the unique display name of an AWS account. Specify `samlp` (SAML), `google-apps` (Google Apps), or `waad` (Azure AD).
  - name: domains
    required: yes
    content: Array that specifies SSO domains, with each domain specified in `company.com` format.
  - name: default_organization_id
    required: no
    content: Number that specifies the ID of the default organization to which new users should be assigned.
  - name: endpoint
    required: yes, if `sso_provider == saml`
    content: String that specifies the SAML 2.0 Endpoint from your IdP.
  - name: certificate
    required: yes, if `sso_provider == saml`
    content: String that specifies the contents of the X.509 certificate from your IdP.
  - name: sso_ignore_idp_organization
    required: yes, if `sso_provider == saml`
    content: Boolean that specifies whether the IdP does not support passing the organization to which a new user should be assigned. Default value is `false`.
  - name: azure_ad_roles_protocol
    required: yes, if `sso_provider == waad`
    content: Boolean that specifies whether the Azure Roles protocol is used to pass roles to the CloudHealth Platform. Default value is `true`.
right_code_blocks:
  - code_block: |-
      curl -X PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d '{"sso_provider":"google-apps", "domains":["cloudhealthtech.com"]}' 'https://chapi.cloudhealthtech.com/v1/sso/configure'
    title: Request Body
    language: bash
  - code_block: |-
      {"success":"SSO configured for CloudHealth Technologies", "configuration_url": "www.provider.com/configure" }
    title: Response
    language: json
---