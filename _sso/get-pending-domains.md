---
title: Retrieve Pending SSO Domains
position: 4
description: Retrieve SSO domains that are awaiting validation
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/sso/pending_domain_claims
parameters:
  - name: client_api_id
    required: no
    content: String that specifies the unique customer API Key that CloudHealth generates. See [How to Get Client API ID](#partner_how-to-get-client-api-id).
right_code_blocks:
  - code_block: |-
      curl -X GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' 'https://chapi.cloudhealthtech.com/v1/sso/pending_domain_claims'
    title: Sample Request
    language: bash
  - code_block: |-
      {"pending_sso_domains": [{"domain":"cloudhealthtech.com", "token":"xxxxx-xxxxx-xxxxx", "created_at":"2019-07-10T18:45:47Z", "created_by_id":11937}]}
    title: Sample Response
    language: json
---