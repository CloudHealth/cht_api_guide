---
title: Get All CSP Partner Customers
position: 8
description: Retrieve a list of all customer tenants. This information is retrieved from the Azure Portal.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/azure_partner_customers
content_markdown: |-
  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `200 OK`                   | Operation was successful |
  | `401 Unauthorized`         | Unauthorized entry       |
  | `500 Internal Service Error` | Internal service error |

right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        'https://chapi.cloudhealthtech.com/v1/azure_partner_customers'
    title: Sample Request
    language: bash
---
