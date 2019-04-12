---
title: Get Single AWS Account Assignment (Version 2)
position: 5
description: Retrieve information on a single AWS account assignment.
type: get
endpoint: https://chapi.cloudhealthtech.com/v2/aws_account_assignments/:id
content_markdown: |-
  #### Response content
  A JSON object with the following fields:
  * `id`: The ID of an AWS account assignment
  * `owner_id`: The AWS ID of the assigned account
  * `target_client_api_id`: the client API ID of the customer
  * `payer_account_owner_id`: The AWS ID of the account whose bills receive the billing line items for the assigned account
  * `billing_block_type`: The type of billing block
  * `billing_block_name`: The name of the billing block 

right_code_blocks:
  - code_block: |-
      curl --request GET \
        'https://chapi.cloudhealthtech.com/v2/aws_account_assignments/<id>?api_key=<your_api_key>' \
        -H 'Content-Type: application/json'
    title: Sample Request
    language: bash
---
