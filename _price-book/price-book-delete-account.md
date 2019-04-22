---
title: Delete Existing Price Book Account Assignment
position: 18
description: Delete a custom price book's AWS account assignment.
type: delete
endpoint: https://chapi.cloudhealthtech.com/v1/price_book_account_assignments/:id
right_code_blocks:
  - code_block: |-
      curl --request DELETE -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json'
      'https://chapi.cloudhealthtech.com/v1/price_book_account_assignments/<id>'
    title: Sample Request
    language: bash
---
