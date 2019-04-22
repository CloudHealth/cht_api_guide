---
title: Read All AWS Account Assignments (Version 1)
position: 10
description: Get information on all AWS account assignments.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/aws_account_assignments
content_markdown: |-
  #### Response header
  * `X-Total`: The total number of AWS account assignments
  * `X-Per-Page`: The number of AWS account assignments that are returned per page
  * `Link`: A list of pages if the response content is truncated due to paging

  #### Response content
  A JSON object with one field, `aws_account_assignments`, whose value is an array of objects with the following fields:
  * `id`: The ID of an AWS account assignment
  * `owner_id`: The AWS ID of the assigned account
  * `customer_id`: The ID of the customer to whom the account is assigned
  * `payer_account_owner_id`: The AWS ID of the account whose bills receive the billing line items for the assigned account

  The response content is paged if the total number of AWS account assignments is greater than the number that is returned per page.

right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json'
        'https://chapi.cloudhealthtech.com/v1/aws_account_assignments/'
    title: Sample Request
    language: bash
---
