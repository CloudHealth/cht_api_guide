---
title: Retrieve a Single Statement
position: 10
description: Retrieve a billing statement by ID.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/customer_statements/:id
right_code_blocks:
  - code_block: |-
      curl -H "Content-Type: application/json" 'https://chapi.cloudhealthtech.com/v1/customer_statements/:id?api_key=<your_api_key>'
    title: Request
    language: bash
  - code_block: |-
      {
        customer_id : 1211,
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
