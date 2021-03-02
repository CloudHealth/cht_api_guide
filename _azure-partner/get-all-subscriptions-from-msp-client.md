---
title: Get all MSP Client Subscriptions
position: 11
description: List all subscriptions associated with MSP clients.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/azure_subscriptions/list/db_msp_client_id
content_markdown: |-
  | Response Code              | Description                                                                   |
  | -------------------------- | ----------------------------------------------------------------------------- |
  | `401`                      | API key is wront or the request is not made by the partner                    |
  | `500`                      | Internal server error                                                         |
  | `422`                      | Azure ID is not found or is invalid or already assigned to a MSP client       |
  | `404`                      | MSP client ID not found                                                       |
  | `403`                      | API key provided is invalid                                                   |

right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        'https://chapi.cloudhealthtech.com/v1/azure_subscriptions/list/db_msp_client_id'
    title: Sample Request
    language: bash
---