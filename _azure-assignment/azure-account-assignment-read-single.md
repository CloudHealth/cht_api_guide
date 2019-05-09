---
title: Get Single Azure Account Assignment
position: 4
description: Retrieve information on a single Azure account assignment.
type: get
endpoint: /v1/azure_partner_customer_accounts/list/:client_api_id

content_markdown: |-

  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `200 OK`                   | Operation was successful |
  | `401 Unauthorized`         | Unauthorized entry       |
  | `500 Internal Service Error` | General error          |

right_code_blocks:
  - code_block: |-
      "azure_partner_customer_accounts":[{
        "customer_tenant_name":"arriva",
        "azure_partner_customer_account":{
          "name":"abacus",
          "domain":"abacus.onmicrosoft.com",
          "azure_customer_id":"dfg234",
          "created_at": "2018-12-27T17:36:36Z",
          "updated_at": "2019-04-26T20:49:59Z"
        }
      },{
        "customer_tenant_name":"arriva",
        "azure_partner_customer_account":{
          "name":"card technologies"
          "domain":"card.onmicrosoft.com",
          "azure_customer_id":"xof194",
          "created_at": "2018-12-27T17:36:36Z",
          "updated_at": "2019-04-26T20:49:59Z"
        }
      }]
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json'
        'https://chapi.cloudhealthtech.com/v1/azure_partner_customer_accounts/list/<client_api_id>'
    title: Sample Request
    language: bash
---
