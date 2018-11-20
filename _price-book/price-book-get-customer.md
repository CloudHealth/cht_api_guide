---
title: Get Price Book Customer Assignment
position: 15
description: Retrieve one customer assigned to a custom price book.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/price_book_assignments/:id
right_code_blocks:
  - code_block: |-
      {
        "id": 1,
        "price_book_id": XXXX,
        "target_customer_id": <client_api_id>,
        "created_at": "2018-01-01",
        "updated_at": "2018-01-01"
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET -H 'Content-Type: application/json'
      'https://chapi.cloudhealthtech.com/v1/price_book_assignments/<id>?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
