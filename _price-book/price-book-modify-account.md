---
title: Modify Existing Price Book Account Assignment
position: 17
description: Modify which AWS account a custom price book is assigned to.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/price_book_account_assignments/:id
right_code_blocks:
  - code_block: |-
      {
        "billing_account_owner_id": <string>
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "id": 36,
        "target_customer_id": <client_api id>,
        "price_book_assignment_id": <int>,
        "billing_account_owner_id": <string>
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Content-Type: application/json' -d
        '{
          "billing_account_owner_id": <string>
        }'
      'https://chapi.cloudhealthtech.com/v1/price_book_account_assignments/<id>?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
