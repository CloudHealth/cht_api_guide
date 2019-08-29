---
title: Get All Price Book Account Assignments
position: 19
description: Retrieve a list of all AWS accounts assigned to a custom price book.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/price_book_account_assignments
parameters:
  - name: page
    content: Specify the page number for results
  - name: per_page
    content: Specify how many results should be displayed per page. Default value is 30.
right_code_blocks:
  - code_block: |-
      {
        "price_book_account_assignments": [
        {
        "id": 55,
        "target_client_api_id": <client_api id>,
        "price_book_assignment_id": <int>,
        "billing_account_owner_id": <string>
        },
        {
        "id": 56,
        "target_client_api_id": <client_api id>,
        "price_book_assignment_id": <int>,
        "billing_account_owner_id": <string>
        }
        ]
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json'
      'https://chapi.cloudhealthtech.com/v1/price_book_account_assignments'
    title: Sample Request
    language: bash
---
