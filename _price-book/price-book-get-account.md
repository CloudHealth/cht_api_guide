---
title: Get Price Book Account Assignment
position: 20
description: Retrieve one AWS account assigned to a custom price book.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/price_book_account_assignments/:id
right_code_blocks:
  - code_block: |-
      {
        "id": 56,
        "target_client_api_id": <client_api id>,
        "price_book_assignment_id": <int>,
        "billing_account_owner_id": <string>
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json'
      'https://chapi.cloudhealthtech.com/v1/price_book_account_assignments/<id>'
    title: Sample Request
    language: bash
---
