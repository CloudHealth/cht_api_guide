---
title: Delete Existing Price Book
position: 4
description: Delete a custom price book from the CloudHealth Platform.
type: delete
endpoint: https://chapi.cloudhealthtech.com/v1/price_books/:price book id
right_code_blocks:
  - code_block: |-
      curl --request DELETE -H 'Content-Type: application/json'
      'https://chapi.cloudhealthtech.com/v1/price_books/<price book id>?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
