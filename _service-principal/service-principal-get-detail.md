---
title: Details of Service Principal
position: 5
description: Get details for a specific service principal.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/azure_service_principals/:sp_id
right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
          'https://chapi.cloudhealthtech.com/v1/azure_service_principals/<sp_id>/'
    title: Sample Request
    language: bash
---
