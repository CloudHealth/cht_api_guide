---
title: How to Get CloudHealth Billing Account ID
position: 3
content_markdown: |-
  In order to use some of the GCP Billing Account endpoints, you need to provide the `cloudhealth_billing_account_id`. CloudHealth generates a unique ID for each billing account.

  You can get the CloudHealth Billing Account ID for a billing account from the CloudHealth Platform. From the left menu, go to **Setup > Accounts > GCP Billing** and open the billing account. The CloudHealth Billing Account ID of the partner customer appears in the browser URL. Here's an example URL:
  ```
  https://apps.cloudhealthtech.com/gcp_billing_accounts/5XXXXXXXXXX25
  ```

  Here, `5XXXXXXXXXX25` is the CloudHealth Billing Account ID.

  The CloudHealth Billing Account ID can also be retrieved using the [Get All GCP Billing Accounts](#gcp-account_get-all-gcp-billing-accounts) endpoint.
---
