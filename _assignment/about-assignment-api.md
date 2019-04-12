---
title: Introduction to Partner AWS Account Assignment API
description: An introduction to the Account Assignment API.
position: 1
parameters:
  - name:
    content:
content_markdown: |-
  Use this API to administer AWS Accounts that belong to CloudHealth Partners and to assign AWS accounts to Partner Customers for partner-generated billing purposes.

  Partner AWS Account Assignment API is available in two versions:
    * **[Version 2](#assignment_how-aws-account-assignments-are-validated-version-2):** This API supports partner billing blocks and allows partners to assign AWS accounts in billing blocks to partner customers programmatically. Once you have assigned AWS accounts to a partner customer using Version 2 API, you can no longer use Version 1 API to assign, modify, get, or delete account assignments for that partner customer.
    * **[Version 1](#assignment_how-aws-account-assignments-are-validated-version-1)**: This legacy API was created prior to the release of the partner billing block feature, which allows partners to quickly and easily assign multiple accounts in different billing configurations to partner customers at the same time. Consequently, Version 1 API does not support billing blocks.

  CloudHealth recommends using Version 2 API to create new account assignments for partner customers and switching Version 1 partner customers to Version 2.
---
