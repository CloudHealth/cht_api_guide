---
title: Validate Pending SSO Domains
position: 5
description: Validate SSO domains that are pending
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/sso/validate_pending_domain_claim
parameters:
  - name: client_api_id
    required: no
    content: String that specifies the unique customer API Key that CloudHealth generates. See [How to Get Client API ID](#partner_how-to-get-client-api-id).
  - name: pending_domain_name
    required: yes
    content: String that specifies the domain to validate in `company.com` format.
right_code_blocks:
  - code_block: |-
      curl -X PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d '{"pending_domain_name":"cloudhealthtech.com"}' 'https://chapi.cloudhealthtech.com/v1/sso/validate_pending_domain_claim'
    title: Sample Request
    language: bash
  - code_block: |-
      {"valid":"true" }
    title: Sample Response
    language: json
---