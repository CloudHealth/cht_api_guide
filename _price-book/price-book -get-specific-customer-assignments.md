---
title: Get Specific Customer Price Book Assignments
position: 21
description: Run a query to get specific channel customer assignments.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/price_book_assignments
right_code_blocks:
  - code_block: |-
      {
        "target_client_api_id": <string>
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "id": 6,
        "target_client_api_id": <client_api_id>,
        "price_book_id": XXXX,
        "created_at": "2018-01-01",
        "updated_at": "2018-01-01"
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d '{"target_client_api_id": <client_api_id>}'
      'https://chapi.cloudhealthtech.com/v1/price_book_assignments'
    title: Sample Request
    language: bash
---
