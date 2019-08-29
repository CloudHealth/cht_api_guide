---
title: Get All Price Book Customer Assignments
position: 14
description: Retrieve a list of all customers assigned to a custom price book.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/price_book_assignments
parameters:
  - name: page
    content: Specify the page number for results
  - name: per_page
    content: Specify how many results should be displayed per page. Default value is 30.
right_code_blocks:
  - code_block: |-
      {
        "id": 1,
        "price_book_id": XXXX,
        "target_client_api_id": <client_api_id>,
        "created_at": "2018-01-01",
        "updated_at": "2018-01-01"
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json'
      'https://chapi.cloudhealthtech.com/v1/price_book_assignments'
    title: Sample Request
    language: bash
---
