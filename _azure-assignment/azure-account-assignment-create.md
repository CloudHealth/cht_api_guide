---
title: Create Azure Account Assignment
position: 2
description: Assign Azure accounts to Partner Customers for partner-generated billing purposes.
type: put
endpoint: /v1/azure_partner_customer_accounts/add/:client_api_id
parameters:
  - name: azure_customer_ids
    required: yes
    content: An array of the customer IDs of the assigned Azure customer accounts.
content_markdown: |-
  If the corresponding Azure account does not exist in the customer’s CloudHealth account, it is created. If there is an error associated with one Azure account, none of the accounts in the request are assigned.

  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `207 OK`                   | Operation was successful but may contain error messages |
  | `401 Unauthorized`         | Unauthorized entry       |
  | `404 Not Found`            | Bad endpoint             |
  | `422 Unprocessable Entity` | Unprocessable entity     |
  | `500 Internal Service Error` | General error          |

right_code_blocks:
  - code_block: |-
      {
        "azure_customer_ids": ["ab123", "fgh345"]
      }
    title: Request Body
    language: json
  - code_block: |-
      "azure_partner_customer_accounts": [
        {
          "customer_tenant_name": "Azure Two",
          "partner_customer_account": {
            "name": "Indigo Montoya Inc",
            "domain": "chazureteam.onmicrosoft.com",
            "azure_customer_id": "abc"
            "created_at": "2018-12-27T17:36:36Z",
            "updated_at": "2019-04-26T20:49:59Z"
          }
        },
        {
          "http_status": 422
          "error": "azure_customer_id not found"
          "azure_customer_id": "fgh345"
        }]
    title: Response Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        {
          "azure_customer_ids": ["ab123", "fgh345"]
        }
        'https://chapi.cloudhealthtech.com/v1/azure_partner_customer_accounts/add/<client_api_id>'
    title: Sample Request
    language: bash
---
