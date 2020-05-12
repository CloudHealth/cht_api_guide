---
title: Delete Existing Billing Rule
position: 8
description: Delete a billing rule from the CloudHealth Platform.
type: delete
endpoint: https://chapi.cloudhealthtech.com/v1/partner_billing_rules/:partner_billing_rule_id
right_code_blocks:
  - code_block: |-
      curl --request DELETE -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
          'https://chapi.cloudhealthtech.com/v1/partner_billing_rules/<partner_billing_rule_id>'
    title: Sample Request
    language: bash
---
