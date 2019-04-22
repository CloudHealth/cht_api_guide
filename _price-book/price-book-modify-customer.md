---
title: Modify Existing Price Book Customer Assignment
position: 12
description: Modify which custom price book is assigned to a customer.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/price_book_assignments/:id
right_code_blocks:
  - code_block: |-
      {
        "price_book_id": XXXX
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
      curl --request PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        '{
          "price_book_id": XXXX
        }'
      'https://chapi.cloudhealthtech.com/v1/price_book_assignments/<id>'
    title: Sample Request
    language: bash
---
