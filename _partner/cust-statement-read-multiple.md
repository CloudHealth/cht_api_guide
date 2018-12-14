---
title: Retrieve All Statements
position: 11
description: Retrieve billing statements for all partner customers.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/customer_statements
parameters:
  - name: page
    content: Specify the page number for results
  - name: per_page
    content: Specify how many results should be displayed per page. Default value is 30.
right_code_blocks:
  - code_block: |-
      curl -H "Content-Type: application/json" 'https://chapi.cloudhealthtech.com/v1/customer_statements?api_key=<your_api_key>'
    title: Request
    language: bash
  - code_block: |-
      {
        billing_artifacts : [
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
          },
          ...
        ]
      }
    title: Response
    language: bash
---
