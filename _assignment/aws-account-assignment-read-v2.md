---
title: Get All AWS Account Billing Blocks (Version 2)
position: 4
description: Retrieve a list of all AWS billing blocks and their account assignments.
type: get
endpoint: https://chapi.cloudhealthtech.com/v2/aws_account_assignments
parameters:
  - name: target_client_api_id
    content: The client API ID of the customer.
content_markdown: |-
  #### Response header
  * `X-Total`: The total number of AWS account assignments
  * `X-Per-Page`: The number of AWS account assignments that are returned per page

  #### Response content
  A JSON object with one field, `aws_account_assignments`, whose value is an array of objects with the following fields:
  * `id`: The ID of an AWS account assignment
  * `owner_id`: The AWS ID of the assigned account
  * `payer_account_owner_id`: The AWS ID of the account whose bills receive the billing line items for the assigned account
  * `billing_block_type`: The type of billing block
  * `billing_block_name`: The name of the billing block

  The response content is paged if the total number of AWS account assignments is greater than the number that is returned per page.

right_code_blocks:
  - code_block: |-
      curl --request GET \
        'https://chapi.cloudhealthtech.com/v2/aws_account_assignments/' \
        -H 'Content-Type: application/json'
        -H 'Authorization: Bearer <your_api_key>'
    title: Sample Request
    language: bash
---
