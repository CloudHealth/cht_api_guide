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
  - name: target_client_api_id
    required: yes
    content: String that specifies which customer's client_api_id to test the custom price book on.
  - name: month
    required: yes
    content: String that specifies the bill month to test the custom price book on.
  - name: billing_account_owner_id
    required: yes
    content: String that specifies which account to test the custom price book on.
  - name: upload_to_s3
    optional: yes
    content: If set to true, the test results will be uploaded to the Bill Generation S3 bucket configured in the UI under Setup > Admin > Settings, within the 'cpb-dryrun-results' directory. Default value is false and an email will be sent.

right_code_blocks:
  - code_block: |-
      {
        "price_book_id": XXXX,
        "target_client_api_id": <customer_api_id>,
        "month": "2021-01",
        "billing_account_owner_id": 1234
      }
    title: Request Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Content-Type: application/json' -d
      '{
        "price_book_id": XXXX,
        "target_client_api_id": <customer_api_id>,
        "month": "2021-01",
        "billing_account_owner_id": 1234
      }'
      'https://chapi.cloudhealthtech.com/v1/price_books/dry_run?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
