---
title: Delete Existing Customer
position: 7
description: Delete a partner customer tenant from the CloudHealth Platform.
type: delete
endpoint: https://chapi.cloudhealthtech.com/v1/customers/:customer_id
right_code_blocks:
  - code_block: |-
      curl -X "DELETE" 'https://chapi.cloudhealthtech.com/v1/customers/<customer_id>'
        -H 'Authorization: Bearer <your_api_key>'
    title: Sample Request
    language: bash
---
