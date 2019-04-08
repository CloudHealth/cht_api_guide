---
title: Details of Service Principal
position: 5
description: Get details for a specific service principal.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/azure_service_principals/:sp_id
right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Content-Type: application/json' -d
          'https://chapi.cloudhealthtech.com/v1/azure_service_principals/<sp_id>/?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
