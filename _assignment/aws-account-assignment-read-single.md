---
title: Read Single AWS Account Assignment
position: 5
description: Enable an AWS Account in the CloudHealth Platform.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/aws_account_assignments
parameters:
  - name: id
    required: yes
    content: The ID of the AWS account assignment
content_markdown: |-
  #### Response content
  A JSON object with one field, `aws_account_assignments`, whose value is an array of objects with the following fields:
  * `id`: The ID of an AWS account assignment
  * `owner_id`: The AWS ID of the assigned account
  * `customer_id`: The ID of the customer to whom the account is assigned
  * `payer_account_owner_id`: The AWS ID of the account whose bills receive the billing line items for the assigned account

  The response content is paged if the total number of AWS account assignments is greater than the number that is returned per page.

right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Content-Type: application/json'
        'https://chapi.cloudhealthtech.com/v1/aws_account_assignments/<id>?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
