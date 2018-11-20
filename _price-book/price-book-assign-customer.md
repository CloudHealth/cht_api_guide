---
title: Assign Price Book to Customer
position: 11
description: Assign a custom price book to a customer or customers.
type: post
endpoint: https://chapi.cloudhealthtech.com/v1/price_book_assignments
parameters:
  - name: price_book_id
    required: yes
    content: Integer that specifies which custom price book to use.
  - name: target_client_api_id
    required: yes
    content: Integer that specifies the assigned customer's client_api_id.

right_code_blocks:
  - code_block: |-
      {
        "price_book_id": XXXX,
        "target_client_api_id": <client_api_id>
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "id": <int>,
        "target_client_api_id": <client_api_id>,
        "price_book_id": XXXX,
        "created_at": "2018-01-01",
        "updated_at": "2018-01-01"
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request POST -H 'Content-Type: application/json' -d
        '{
          "price_book_id": XXXX,
          "target_client_api_id": <client_api_id>
        }'
        'https://chapi.cloudhealthtech.com/v1/price_book_assignments?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
