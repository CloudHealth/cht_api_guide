---
title: Single AWS Account
position: 3
description: Get information on a single AWS Account that is enabled in the CloudHealth Platform.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/aws_accounts/:id

right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -H 'Accept: application/json' "https://chapi.cloudhealthtech.com/v1/aws_accounts/<account_ID>"
    title: Sample Request
    language: bash
---
