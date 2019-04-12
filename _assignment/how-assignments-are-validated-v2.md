---
title: How AWS Account Assignments are Validated (Version 2)
position: 2
description: Understand the criteria through which CloudHealth validates Partner AWS Account assignments.
parameters:
  - name:
    content:
content_markdown: |-
  CloudHealth uses the following criteria to validate AWS Account assignments.
  * The `owner_id` matches the `owner_id` of an [AWS account](#account_enable-aws-account) in the partner’s CloudHealth account.
  * The `owner_id` is assigned to only one `target_client_api_id`.
  * You cannot merge two or more AWS accounts into one Partner Generated Billing account in CloudHealth.
  * When creating a family billing block, if you enter the `owner_id` of a consolidated AWS account, all AWS accounts linked to the consolidated account are also assigned to the specified `target_client_api_id`.

---
