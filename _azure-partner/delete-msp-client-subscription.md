---
title: Delete Subscriptions from MSP client 
position: 12
description: To remove Azure subscription from MSP client.
type: put
endpoint: /v1/azure_subscriptions/remove/:client_api_id
content_markdown: |-
 
  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `401`                      | The API key is wrong or the request is not made by a partner |
  | `500`                      | Internal server error    |
  | `422`                      | Azure ID not found, invalid, or is already assigned |
  | `404`                      | MSP client ID not found  |
  | `403`                      | Invalid API key          |

right_code_blocks:
  - code_block: |-
      {
        "azure_ids": ["1234-abcd-5678-zxy"],
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "code": 200,
        "azure_subscriptions": ["1234-abcd-5678-efgh"],
        "removed_azure_subscriptions": ["1234-abcd-5678-zxy"]
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        {
          "azure_ids": ["1234-abcd-5678-zxy"]
        }
        'https://chapi.cloudhealthtech.com/v1/azure_subscriptions/remove/<client_api_id>'
    title: Sample Request
    language: bash
---
