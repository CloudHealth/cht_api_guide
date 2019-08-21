---
title: Delete SSO configuration
position: 3
description: Delete an existing SSO configuration
type: delete
endpoint: https://chapi.cloudhealthtech.com/v1/sso/unconfigure
parameters:
  - name: client_api_id
    required: no
    content: String that specifies the unique customer API Key that CloudHealth generates. See [How to Get Client API ID](#partner_how-to-get-client-api-id).
right_code_blocks:
  - code_block: |-
      curl -X DELETE -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' 'https://chapi.cloudhealthtech.com/v1/sso/unconfigure'
    title: Sample Request
    language: bash
  - code_block: |-
      {"success":"SSO unconfigured for CloudHealth Technologies"}
    title: Sample Response
    language: json
---