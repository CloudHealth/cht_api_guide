---
title: Assets for Specific Customer
position: 3
description: Retrieve a list of assets associated with a specific partner customer.
type: get
endpoint: https://chapi.cloudhealthtech.com/api/search.json?api_version=2
parameters:
  - name: client_api_id
    required: yes
    content: String that specifies the unique customer API Key that CloudHealth generates.
right_code_blocks:
  - code_block: |-
      curl https://chapi.cloudhealthtech.com/api/search.json?api_version=2&api_key=<your_api_key>&client_api_id=<customer_api_id>
        &name=AwsAccount
    title: Request
    language: bash
---
