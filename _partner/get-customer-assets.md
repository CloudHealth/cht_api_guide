---
title: Assets for Specific Customer
position: 4
description: Retrieve a list of assets associated with a specific partner customer.
type: get
endpoint: https://chapi.cloudhealthtech.com/api/search.json?api_version=2
parameters:
  - name: client_api_id
    required: yes
    content: String that specifies the unique customer API Key that CloudHealth generates. See [How to Get Client API ID](#partner_how-to-get-client-api-id)
  - name: name
    required: yes
    content: String that specifies the unique display name of the customer's AWS account.
right_code_blocks:
  - code_block: |-
      curl 'https://chapi.cloudhealthtech.com/api/search.json?api_version=2&client_api_id=<customer_api_id>
        &name=AwsAccount'
        -H 'Authorization: Bearer <your_api_key>'
    title: Request
    language: bash
---
