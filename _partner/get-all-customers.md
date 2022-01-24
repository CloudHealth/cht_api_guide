---
title: Get All Customers
position: 10
description: Retrieve a list of all customer tenants.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/customers
parameters:
  - name: per_page
    required: no
    content: Integer that specifies the number of assets to return per page.
  - name: page
    required: no
    content: Integer that specifies the page to display when results run over multiple pages.
right_code_blocks:
  - code_block: |-
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' 'https://chapi.cloudhealthtech.com/v1/customers?per_page=25'
    title: Sample Request
    language: bash
---
