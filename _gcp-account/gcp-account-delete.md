---
title: Delete GCP Billing Account
position: 8
description: Remove a GCP billing account from the CloudHealth Platform.
type: delete
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
      {
        "cloudhealth_billing_account_id": "6116033430514",
        "billing_account_name": "Chayan Test BA",
        "billing_account_id": "00807B-DFFF5B-2DAAB8",
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request DELETE -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        'https://chapi.cloudhealthtech.com/v1/gcp_billing_accounts/<cloudhealth_billing_account_id>'
    title: Sample Request
    language: bash
---
