---
title: Delete AWS Account Assignment (Version 2)
position: 7
description: Delete the relationship between an AWS account and the Partner Customer to which it was assigned. For consolidated billing blocks, the designated payer account assignment cannot be deleted through an API endpoint and must be deleted in the CloudHealth Platform. **Note:** If all accounts assigned to a billing block are deleted, the billing block is also deleted.
type: delete
endpoint: https://chapi.cloudhealthtech.com/v2/aws_account_assignments/:id
content_markdown: |-
  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `200 OK`                   | Operation was successful |
  | `400 Bad Request`          | Unprocessable entity     |

right_code_blocks:
  - code_block: |-
      curl --request DELETE \
        'https://chapi.cloudhealthtech.com/v2/aws_account_assignments/<id>?api_key=<your_api_key>' \
        -H 'Content-Type: application/json'
    title: Sample Request
    language: bash
---
