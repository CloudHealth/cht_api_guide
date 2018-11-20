---
title: Modify Existing Price Book
position: 3
description: Modify a custom price book that already exists in the CloudHealth Platform.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/price_books/:price book id
right_code_blocks:
  - code_block: |-
      {
        "specification": <XML>
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "id": XXXX,
        "book_name": "Gold tier",
        "created_at": "2018-01-01",
        "updated_at": "2018-01-01"
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Content-Type: application/json' -d
        '{
          "specification": <XML>
          }'
      'https://chapi.cloudhealthtech.com/v1/price_books/<price book id>?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
