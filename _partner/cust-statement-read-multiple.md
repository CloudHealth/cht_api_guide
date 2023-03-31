---
title: Statements for All Customers
position: 12
description: Retrieve billing statements for all partner customers.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/customer_statements
parameters:
  - name: status
    required: no
    content: String that specifies the status of the statement. Valid values are `Final` or `Estimated`.
  - name: billing_period
    required: no
    content: String that specifies the billing_period of the statement. The date is specified in the format `YYYY-MM`.
  - name: per_page
    required: no
    content: Integer that specifies the number of assets to return per page.
  - name: page
    required: no
    content: Integer that specifies the page to display when results run over multiple pages.
right_code_blocks:
  - code_block: |-
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' 'https://chapi.cloudhealthtech.com/v1/customer_statements/?page=1&status=Final&billing_period=2020-12&per_page=2'
    title: Request
    language: bash
  - code_block: |-
      {
        cloud: "AWS",
        billing_period : "2020-12",
        total_amount : 211,523.09,
        status : "Final",
        detailed_billing_records_generation_time : "2020-12-23 23:59:11",
        statement_generation_time : "2020-12-23 23:59:41",
        statement_summary_generation_time : "2020-12-23 23:59:53",
        currency: {
          name: "USD",
          symbol: "$"
        }
      }
    title: Response
    language: bash
---
