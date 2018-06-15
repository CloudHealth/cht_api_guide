---
title: Update AWS Account Assignment
position: 6
description: Update an existing AWS account assignment.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/aws_account_assignments
parameters:
  - name: id
    required: yes
    content: The ID of the AWS account assignment
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
  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `200 OK`                   | Operation was successful |
  | `422 Unprocessable Entity` | Unprocessable entity     |

  #### Response header
  * `Location`: The location of the created AWS account assignment.

  #### Response content
  A JSON object that contains these fields:
  * All the fields in the request
  * `id`: The ID of the account assignment that was created

right_code_blocks:
  - code_block: |-
      curl --request PUT -H 'Content-Type: application/json' -d
        '{
          "owner_id": "000000000001",
          "customer_id": 1,
          "payer_account_owner_id": "000000000001"
        }'
        'https://chapi.cloudhealthtech.com/v1/aws_account_assignments/<id>?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
