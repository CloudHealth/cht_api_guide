---
title: Get Single GCP Billing Account
position: 6
description: Retrieve a specific GCP billing account that you have enabled with the CloudHealth Platform.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/gcp_billing_accounts/:cloudhealth_billing_account_id
parameters:
  - name: cloudhealth_billing_account_id
    required: yes
    content: The CloudHealth billing account ID of the GCP billing account. For more information, see [How to Get CloudHealth Billing Account ID](#gcp-account_how-to-get-cloudhealth-billing-account-id).
  - name: client_api_id
    required: no
    content: The client API ID of the partner customer whose billing account is being added. Required for partners configuring a partner customer's billing account.
right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        'https://chapi.cloudhealthtech.com/v1/gcp_billing_accounts/<cloudhealth_billing_account_id>'
    title: Sample Request
    language: bash
---
