---
title: AWS Accounts in CloudHealth
position: 2
description: Get a list of all AWS Accounts that are enabled in the CloudHealth Platform.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/aws_accounts
content_markdown: |-
  The results of this API call are paginated.
parameters:
  - name: page
    content: Specify the page number for results
  - name: per_page
    content: Specify how many results should be displayed per page. Default value is 30. Maximum value is 100.
  - name: org_id
    required: no
    content: String that specifies the ID of the organization in which this query should run. See [How to Get Organization ID](#organization_how-to-get-organization-id). If not specified, this parameter assumes the ID of your default organization.
right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' "https://chapi.cloudhealthtech.com/v1/aws_accounts"
    title: All results
    language: bash
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' "https://chapi.cloudhealthtech.com/v1/aws_accounts?page=2"
    title: Specific page
    language: bash
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' "https://chapi.cloudhealthtech.com/v1/aws_accounts?page=3&per_page=100"
    title: Results per page
    language: bash
---
