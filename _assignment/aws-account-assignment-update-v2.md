---
title: Update AWS Account Billing Block (Version 2)
position: 6
description: Update which AWS account is the designated payer account in an existing consolidated billing block.
type: put
endpoint: https://chapi.cloudhealthtech.com/v2/aws_account_assignments/:target_client_api_id
parameters:
  - name: billing_block_name
    required: yes
    content: String that specifies the name of the consolidated billing block.
  - name: payer_account_owner_id
    required: yes
    content: specify the owner ID of the designated payer account for the consolidated billing block.
content_markdown: |-
  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `200 OK`                   | Operation was successful |
  | `422 Unprocessable Entity` | Unprocessable entity     |

right_code_blocks:
  - code_block: |-
      {
        "billing_block_name": "block name2",
        "payer_account_owner_id":"000000000003"
      }
    title: Request Body
    language: bash
  - code_block: |-
      {
        "aws_account_assignments": [
          {
            "id": 123333333334,
            "owner_id": "000000000002",
            "target_client_api_id": 1234,
            "payer_account_owner_id": "000000000003",
            "billing_family_owner_id": "000000000001",
            "billing_block_type": "Consolidated",
            "billing_block_name": "block name2",
            "errors": {}
          },
          {
            "id": 123333333335,
            "owner_id": "000000000003",
            "target_client_api_id": 1234,
            "payer_account_owner_id": "000000000003",
            "billing_family_owner_id": "000000000001",
            "billing_block_type": "Consolidated",
            "billing_block_name": "block name2",
            "errors": {}
          }
        ]
      }
    title: Response Body
    language: bash
  - code_block: |-
      curl --request PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d\
        '{
          "billing_block_name": "block name2",
          "payer_account_owner_id":"000000000003"
        }'\
        'https://chapi.cloudhealthtech.com/v2/aws_account_assignments/<target_client_api_id>'
    title: Sample Request
    language: bash
---
