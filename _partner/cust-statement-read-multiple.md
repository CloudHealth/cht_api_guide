---
title: Statements for All Customers
position: 12
description: Retrieve billing statements for all partner customers.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/customer_statements
right_code_blocks:
  - code_block: |-
      curl -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' 'https://chapi.cloudhealthtech.com/v1/customer_statements'
    title: Request
    language: bash
  - code_block: |-
      {
        customer_id : 1211,
        cloud: "AWS",
        billing_period : "2016-08",
        total_amount : 211,523.09,
        status : "estimated",
        detailed_billing_records_generation_time : "2016-08-23 23:59:11",
        statement_generation_time : "2016-08-23 23:59:41",
        statement_summary_generation_time : "2016-08-23 23:59:53",
        currency: {
          name: "USD",
          symbol: "$"
        }
      }
    title: Response
    language: bash
---
