---
title: Get Price Book Request
position: 6
description: Retrieve a specific custom price book.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/price_books/:id
right_code_blocks:
  - code_block: |-
      {
        "id":61,
        "book_name":"Test Price Book",
        "file_hash":"3d9cb352ba6a00d3211ab8f18507c5ce",
        "created_at":"2018-01-01",
        "updated_at":"2018-01-25"
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET -H 'Content-Type: application/json'
      'https://chapi.cloudhealthtech.com/v1/price_books/<id>?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
