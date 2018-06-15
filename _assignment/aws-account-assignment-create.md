---
title: Create AWS Account Assignment
position: 3
description: Assign AWS accounts to Partner Customers for partner-generated billing purposes.
type: post
endpoint: https://chapi.cloudhealthtech.com/v1/aws_account_assignments
parameters:
  - name: owner_id
    required: yes
    content: The AWS ID of the assigned account.
  - name: customer_id
    required: yes
    content: The ID of the customer to whom the account is assigned. For information on how to get this ID, see [Create Partner Customer](#partner_create-partner-customer).
  - name: payer_account_owner_id
    required: no
    content: The AWS ID of the account whose bills should receive the billing line items for the assigned account.
content_markdown: |-
  If the corresponding AWS account does not exist in the customer’s CloudHealth account, it is created.

  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `200 OK`                   | Operation was successful |
  | `422 Unprocessable Entity` | Unprocessable entity     |

  #### Response header
  * `Location`: The location of the created AWS account assignment.

  #### Response content
  A JSON object that contains these fields:
  * All the fields in the request
  * `id`: The ID of the AWS account assignment that was created

right_code_blocks:
  - code_block: |-
      {
        "owner_id": "000000000001",
        "customer_id": 1,
        "payer_account_owner_id": "000000000001"
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "customer_id": 1,
        "id": 1,
        "owner_id": "000000000001",
        "payer_account_owner_id": "000000000001"
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request POST -H 'Content-Type: application/json' -d
        '{
          "owner_id": "000000000001",
          "customer_id": 1,
          "payer_account_owner_id": "000000000001"
        }'
        'https://chapi.cloudhealthtech.com/v1/aws_account_assignments?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
