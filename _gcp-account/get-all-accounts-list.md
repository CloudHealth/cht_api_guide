---
title: Get All GCP Billing Accounts
position: 5
description: Retrieve a list of all GCP billing accounts that have been enabled with the CloudHealth Platform.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/gcp_billing_accounts
parameters:
  - name: client_api_id
    required: no
    content: The client API ID of the partner customer whose billing account is being added. Required for partners configuring a partner customer's billing account.
  - name: per_page
    required: no
    content: Specify how many results should be displayed per page. Default value is 25. Maximum value is 50.
  - name: page
    required: no
    content: Specify the page number for results. Default value is 1.
right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        'https://chapi.cloudhealthtech.com/v1/gcp_billing_accounts?per_page=<max_page_count>&page=<page_number>'
    title: Sample Request
    language: bash
---
