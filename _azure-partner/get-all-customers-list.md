---
title: Get All Partner Customers
position: 5
description: Retrieve a list of all customer tenants that you have created in the CloudHealth Platform. This information is retrieved from the CloudHealth Platform. This endpoint can be used for both AWS and Azure customer tenants.
type: get
endpoint: https://chapi.cloudhealthtech.com/v2/customers
right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        'https://chapi.cloudhealthtech.com/v2/customers'
    title: Sample Request
    language: bash
---
