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
        "target_client_api_id": <client_api id>,
        "price_book_assignment_id": <int>,
        "billing_account_owner_id": <string>
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        '{
          "billing_account_owner_id": <string>
        }'
      'https://chapi.cloudhealthtech.com/v1/price_book_account_assignments/<id>'
    title: Sample Request
    language: bash
---
