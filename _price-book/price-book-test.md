---
title: Test New Price Book
position: 9
description: Test a customer's new custom price book without impacting the customer's CloudHealth environment. The test results are emailed to the email address specified in the partner CloudHealth account profile. See [Understand Price Book Test Results](#price-book_understand-price-book-test-results).
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/price_books/dry_run
parameters:
  - name: price_book_id
    required: yes
    content: String that specifies which custom price book to use.
  - name: customer_id
    required: yes
    content: String that specifies which customer's client_api_id to test the custom price book on.
  - name: month
    required: yes
    content: String that specifies the bill month to test the custom price book on.
  - name: billing_account_owner_ids
    required: no
    content: String that specifies which accounts to test the custom price book on. If no billing accounts are specified, all accounts are tested.

right_code_blocks:
  - code_block: |-
      {
        "price_book_id": XXXX,
        "customer_id": <customer_api_id>,
        "month": "2018-01",
        "billing_account_owner_ids": [<string>, ...]
      }
    title: Request Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Content-Type: application/json' -d
      '{
        "price_book_id": XXXX,
        "customer_id": <customer_api_id>,
        "month": "2018-01",
        "billing_account_owner_ids": [<string>, ...]
      }'
      'https://chapi.cloudhealthtech.com/v1/price_books/dry_run?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
