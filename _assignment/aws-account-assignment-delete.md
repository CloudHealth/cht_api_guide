---
title: Delete AWS Account Assignment (Version 1)
position: 13
description: Delete the relationship between an AWS account and the Partner Customer to which it was assigned.
type: delete
endpoint: https://chapi.cloudhealthtech.com/v1/aws_account_assignments
parameters:
  - name: id
    required: yes
    content: The ID of the AWS account assignment
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
      curl --request DELETE -H 'Content-Type: application/json'
        'https://chapi.cloudhealthtech.com/v1/aws_account_assignments/<id>?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
