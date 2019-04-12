---
title: How AWS Account Assignments are Validated (Version 1)
position: 8
description: Understand the criteria through which CloudHealth validates Partner AWS Account assignments.
parameters:
  - name:
    content:
content_markdown: |-
  CloudHealth uses the following criteria to validate AWS Account assignments.
  * All required parameters are provided when you create an AWS account assignment. Review [Required Parameters](#assignment_create-aws-account-assignment).
  * The `owner_id` matches the `owner_id` of an [AWS account](#account_enable-aws-account) in the partner’s CloudHealth account.
    * This `owner_id` does not belong to any other AWS account assignment for the partner.
    * In AWS, the partner’s corresponding AWS account belongs to another account’s consolidated billing family.
  * The `customer_id` matches the `id` of a [customer](#partner_create-partner-customer) that belongs to the partner.
    * This customer has partner billing enabled by setting `enabled` to `true` in its `partner_billing_configuration`.
  * For each customer identified by `customer_id`, all AWS account assignments follow one of these patterns:
    * All of the customer’s AWS accounts are standalone, each corresponding assignment’s `payer_account_owner_id` matches its
      `owner_id`.
    * Only one of the customer’s AWS accounts is assigned as a consolidated account. Its assignment’s `payer_account_owner_id`
      matches its `owner_id`.  All other accounts are assigned as being linked to it. Each corresponding assignment’s `payer_account_owner_id`
      matches the consolidated account’s `owner_id`.
  * If this is a linked account assignment, where the `payer_account_owner_id` does not match the `owner_id`, then the `payer_account_owner_id` matches the `owner_id` of a prior AWS account assignment for the same `customer_id`. These additional criteria apply:
    * The prior AWS account assignment for the payer account, the one whose `owner_id` matches this assignment’s
      `payer_account_owner_id`—satisfies the following criteria:
        * The `owner_id` matches the `payer_account_owner_id`.
    * In AWS, both accounts belong to the same consolidated billing account family—the partner has a single account whose consolidated billing configuration contains both customer accounts as linked accounts.
---
