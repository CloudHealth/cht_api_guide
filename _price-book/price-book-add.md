---
title: Create New Price Book
position: 2
description: Create a new custom price book in the CloudHealth Platform that specifies custom billing rules for your customers.
type: post
endpoint: https://chapi.cloudhealthtech.com/v1/price_books
parameters:
  - name: book_name
    required: yes
    content: String that specifies the unique display name of the custom price book.
  - name: specification
    required: yes
    content: XML-formatted string that specifies the custom billing rules of the price book. See [Understand Format of Price Book Specification](#price-book_understand-format-of-price-book-specification).

right_code_blocks:
  - code_block: |-
      {
        "book_name": "Gold tier",
        "specification": <XML>
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "price_book": {
          "id": XXXX,
          "book_name": "Gold tier",
          "file_hash": "0aa0d13204c2bb",
          "created_at": "2018-01-01",
          "updated_at": "2018-01-01"
        }
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request POST -H 'Content-Type: application/json' -d
        '{
          "book_name": "Gold tier",
          "specification": <XML>
        }'
        'https://chapi.cloudhealthtech.com/v1/price_books?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
