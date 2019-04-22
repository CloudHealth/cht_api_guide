---
title: Create AWS Account Assignment (Version 2)
position: 3
description: Assign AWS accounts to Partner Customers in billing blocks for partner-generated billing purposes.
type: post
endpoint: https://chapi.cloudhealthtech.com/v2/aws_account_assignments
parameters:
  - name: target_client_api_id
    required: yes
    content: String that specifies the unique customer API Key that CloudHealth generates. See [How to Get Client API ID](#partner_how-to-get-client-api-id).
  - name: billing_block_name
    required: no
    content: String that specifies the unique name of the billing block.
  - name: billing_block_type
    required: yes
    content: JSON field that specifies whether the bill generation type of the billing block is `Family`, `Consolidated`, or `Standalone`.
  - name: owner_id
    required: yes
    content: The owner ID of the AWS account in the billing block. For family billing blocks, enter the owner ID of the billing family. For consolidated and standalone billing blocks, enter a comma-separated list of the owner IDs of all the AWS accounts in the billing block.
  - name: payer_account_owner_id
    required: no
    content: For consolidated billing blocks, specify the owner ID of the designated payer account.
content_markdown: |-
  If the corresponding AWS account does not exist in the customer’s CloudHealth account, it is created. If there is an error associated with one AWS account, none of the accounts in the request are assigned.

  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `200 OK`                   | Operation was successful |
  | `422 Unprocessable Entity` | Unprocessable entity     |

right_code_blocks:
  - code_block: |-
      {
        "aws_account_assignments": [
          {
            "target_client_api_id": 123,
            "billing_block_name": "block name1",
            "billing_block_type": "Family",
            "owner_id": "000000000001"
          },
          {
            "target_client_api_id": 1234,
            "billing_block_name": "block name2",
            "billing_block_type": "Consolidated",
            "owner_id": [
              "000000000002",
              "000000000003"
            ],
          "payer_account_owner_id": "000000000002"
          },
          {
            "target_client_api_id": 1234,
            "billing_block_name": "block name3",
            "billing_block_type": "Standalone",
            "owner_id": [
              "000000000004"
            ]
          }
        ]
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "aws_account_assignments": [
          {
            "id": 123333333333,
            "owner_id": "000000000001",
            "target_client_api_id": 123,
            "payer_account_owner_id": "000000000001",
            "billing_block_type": "Family",
            "billing_block_name": "block name1",
            "errors": {}
          },
          {
            "id": 123333333334,
            "owner_id": "000000000002",
            "target_client_api_id": 1234,
            "payer_account_owner_id": "000000000002",
            "billing_block_type": "Consolidated",
            "billing_block_name": "block name2",
            "errors": {}
          },
          {
            "id": 123333333335,
            "owner_id": "000000000003",
            "target_client_api_id": 1234,
            "payer_account_owner_id": "000000000002",
            "billing_block_type": "Consolidated",
            "billing_block_name": "block name2",
            "errors": {}
          },
          {
            "id": 123333333336,
            "owner_id": "000000000004",
            "target_client_api_id": 1234,
            "payer_account_owner_id": "000000000004",
            "billing_block_type": "Standalone",
            "billing_block_name": "block name3",
            "errors": {}
          }
        ]
      }
    title: Response Body
    language: bash
  - code_block: |-
      curl --request POST
        -H 'Authorization: Bearer <your_api_key>'
        -H 'Content-Type: application/json'
        -d\
        '{
          "aws_account_assignments": [
            {
              "target_client_api_id": 123,
              "billing_block_name": "block name1",
              "billing_block_type": "Family",
              "owner_id": "000000000001"
            },
            {
              "target_client_api_id": 1234,
              "billing_block_name": "block name2",
              "billing_block_type": "Consolidated",
              "owner_id": [
                "000000000002",
                "000000000003"
              ],
            "payer_account_owner_id": "000000000002"
            },
            {
              "target_client_api_id": 1234,
              "billing_block_name": "block name3",
              "billing_block_type": "Standalone",
              "owner_id": [
                "000000000004"
              ]
            }
          ]
        }'\
        'https://chapi.cloudhealthtech.com/v2/aws_account_assignments'
    title: Sample Request
    language: bash
---
