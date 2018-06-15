---
title: Understand Format of GovCloud Linkage Payload
description: Learn how to format the relationship that establishes a GovCloud linkage.
position: 16
content_markdown: |-
  Familiarize yourself with the format of the payload that you can post to define the linkage between a GovCloud Commercial Account and a GovCloud Asset Account.

  **GovCloud Commercial Account:** The proxy account that contains the costs for the account in the Detailed Billing Record.

  **GovCloud Asset Account:** The account that owns the AWS assets.

  Express a linkage between two of these accounts in the following format:

  ```
  {
    "govcloud_acct_id": 1,
    "commercial_acct_id": 2
  }
  ```

  In order to get the values of `govcloud_acct_id` and `commercial_acct_id` use these steps:
  1. Make a GET request as shown in [AWS Accounts in CloudHealth](#account_aws-accounts-in-cloudhealth).
  2. From the response, which contains all AWS accounts associated with the customer, isolate the GovCloud Commercial Account and the GovCloud Asset Account.
  3. Copy the value of the `id` field for both accounts.
  4. Use the `id` of the GovCloud Commercial Account as the value of `govcloud_acct_id` and the `id` of the GovCloud Asset Account as the value of `commercial_acct_id`.
---
