---
title: Get All Price Books
position: 5
description: Retrieve a list of all your custom price books.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/price_books/
right_code_blocks:
  - code_block: |-
      [{
        "id": "1",
        "book_name": "Gold Tier",
        "created_at": "2018-01-01",
        "updated_at": "2018-01-01",
        "file_hash": "8b5ad852dc6c11b730"
      },
      {
        "id": "3",
        "book_name": "Silver Tier"
        "created_at": "2018-01-01",
        "updated_at": "2018-01-01",
        "file_hash": "0cd8f13406a4ae"
      }]
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json'
      'https://chapi.cloudhealthtech.com/v1/price_books/'
    title: Sample Request
    language: bash
---
