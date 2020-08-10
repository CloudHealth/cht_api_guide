---
title: How to Encode a JSON Private Key
position: 4
content_markdown: |-
  Several GCP Billing Account API endpoints require you to enter the JSON private key for the service account associated with the billing account. Before you can enter the JSON private key in the endpoint parameter, you must first encode the JSON private key.

  1. Create and download the JSON private key in gcloud. For more information, see the [Creating and Managing Service Account Keys](https://cloud.google.com/iam/docs/creating-managing-service-account-keys).
  2. In gcloud, enter the command `cloudshell download <private key name>.json` to download the JSON private key. When prompted, click `Download`.
  3. In Terminal, enter the command `cd downloads` to open the Downloads folder.
  4. In Terminal, enter the following command to encode the downloaded private key: `base64 < '<private key name>.json'`
  5. Copy the private key generated in the response. Use this private key for the `billing_account_service_account_json_key` or `linked_projects_json_key` parameter.
---
