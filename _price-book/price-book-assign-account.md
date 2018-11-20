---
title: Assign Price Book to Account
position: 16
description: Assign a custom price book to a customer's AWS accounts. The custom price book must have already been [assigned to the customer](#price-book_assign-price-book-to-customer).
type: post
endpoint: https://chapi.cloudhealthtech.com/v1/price_book_account_assignments
parameters:
  - name: price_book_assignment_id
    required: yes
    content: Integer that specifies which custom price book to use. This ID can be retrieved from the [Get All Price Book Customer Assignments](#price-book_get-all-price-book-customer-assignments) endpoint.
  - name: billing_account_owner_id
    required: no
    content: String that specifies which account to assign the custom price books to. Enter `ALL` to assign the custom price book to all of the assigned customer's accounts or enter a single account ID to assign the price book to one account. To assign the custom price book to multiple (but not all) accounts belonging to a customer, use the **billing_account_owner_ids** parameter.
  - name: billing_account_owner_ids
    required: no
    content: Comma-separated list that specifies which accounts to assign the custom price books to. Use to assign the custom price book to multiple (but not all) of a customer's accounts. To assign the price book to only one account, or to assign the price book to all accounts belonging to the customer, use the **billing_account_owner_id** parameter.

right_code_blocks:
  - code_block: |-
      {
        "price_book_assignment_id": 6,
        "billing_account_owner_ids": ["343243","3432423"]
      }
    title: Request Body for Multiple Accounts
    language: json
  - code_block: |-
      {
        "price_book_assignment_id": 6,
        "billing_account_owner_id": "12345"
      }
    title: Request Body for One Account
    language: json
  - code_block: |-
      {
        "price_book_assignment_id": 6,
        "billing_account_owner_id": "ALL"
      }
    title: Request Body for All Accounts
    language: json
  - code_block: |-
        {
          "price_book_account_assignments": [
          {
            "id": 52,
            "target_client_api_id": <client_api_id>,
            "price_book_assignment_id": 6,
            "billing_account_owner_id": "343243"
          },
          {
            "id": 53,
            "target_client_api_id": <client_api_id>,
            "price_book_assignment_id": 6,
            "billing_account_owner_id": "3432423"
          }
          ]
        }
    title: Response Body for Single or Multiple Accounts
    language: json
  - code_block: |-
      {
        "id": 54,
        "target_client_api_id": <client_api_id>,
        "price_book_assignment_id": 6,
        "billing_account_owner_id": "ALL"
      }
    title: Response Body for All Accounts
    language: json
  - code_block: |-
      curl --request POST -H 'Content-Type: application/json' -d
        '{
          "price_book_assignment_id": XXXX,
          "billing_account_owner_id": "ALL"
        }'
      'https://chapi.cloudhealthtech.com/v1/price_book_account_assignments?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
