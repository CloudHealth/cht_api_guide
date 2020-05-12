---
title: Get Single Billing Rule
position: 7
description: Retrieve a specific billing rule.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/partner_billing_rules/:partner_billing_rule_id
right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
          'https://chapi.cloudhealthtech.com/v1/partner_billing_rules/<partner_billing_rule_id>'
    title: Sample Request
    language: bash
---
