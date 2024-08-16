---
title: Retrieve SSO configuration
position: 2
description: Retrieve an existing SSO configuration
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/sso/configuration
parameters:
  - name: client_api_id
    required: no
    content: String that specifies the unique customer API Key that CloudHealth generates. See [How to Get Client API ID](#partner_how-to-get-client-api-id).
right_code_blocks:
  - code_block: |-
      curl -X GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' 'https://chapi.cloudhealthtech.com/v1/sso/configuration'
    title: Sample Request
    language: bash
  - code_block: |-
      {"configuration":{"sso_provider":"google-apps", "claimed_domains":["cloudhealthtech.com"], "pending_domains":[], "connection_name":"cloudhealthtech-com", "default_organization":"CloudHealth Technologies"} }
    title: Sample Response
    language: json
---