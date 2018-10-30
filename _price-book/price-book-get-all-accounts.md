---
title: Get All Price Book Account Assignments
position: 19
description: Retrieve a list of all AWS accounts assigned to a custom price book.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/price_book_account_assignments
right_code_blocks:
  - code_block: |-
      {
        "price_book_account_assignments": [
        {
        "id": 55,
        "target_customer_id": <client_api id>,
        "price_book_assignment_id": <int>,
        "billing_account_owner_id": <string>
        },
        {
        "id": 56,
        "target_customer_id": <client_api id>,
        "price_book_assignment_id": <int>,
        "billing_account_owner_id": <string>
        }
        ]
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET -H 'Content-Type: application/json'
      'https://chapi.cloudhealthtech.com/v1/price_book_account_assignments?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
