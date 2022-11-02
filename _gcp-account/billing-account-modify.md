---
title: Modify Existing GCP Billing Account
position: 8
description: Modify a GCP billing account that already exists in the CloudHealth Platform.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/gcp_billing_accounts/:cloudhealth_billing_account_id
parameters:
  - name: cloudhealth_billing_account_id
    required: yes
    content: The CloudHealth billing account ID of the GCP billing account. For more information, see [How to Get CloudHealth Billing Account ID](#gcp-account_how-to-get-cloudhealth-billing-account-id).
  - name: client_api_id
    required: no
    content: The client API ID of the partner customer whose billing account is being added. Required for partners configuring a partner customer's billing account.
  - name: billing_account_name
    required: no
    content: String that specifies the unique display name of the customer's billing account.
  - name: billing_account_id
    required: no
    content: The GCP billing account ID of the billing account in the Google Console.   
  - name: bq_billing_dataset
    required: no
    content: String that specifies the BigQuery billing dataset name.
  - name: bq_billing_project
    required: no
    content: String that specifies the BigQuery billing project ID.
  - name: bq_activation_date
    required: no
    content: Date in `YYYY-MM-DD` format that specifies the BigQuery activation date. To locate the activation date, run the following query in the BigQuery Query Editor, replacing `insert_table_name` with the BigQuery table name - `SELECT min(export_time) FROM insert_table_name`
  - name: bq_billing_table
    required: no
    content: String that specifies the name of the BigQuery billing table.
  - name: billing_bucket
    required: no
    content: String that specifies the name of the billing bucket that contains the GCP billing export for the billing account.
  - name: billing_bucket_prefix
    required: no
    content: String that specifies the report prefix for the billing bucket.
  - name: billing_account_service_account
    required: no
    content: String that specifies the GCP service account associated with the billing account.
  - name: billing_account_service_account_json_key
    required: no
    content: Enter the service account’s private JSON key in the format `data:application/json;base64, <private JSON key>`.
  - name: linked_projects_json_key
    required: no
    content: Enter the second service account’s private JSON key in the format `data:application/json;base64, <private JSON key>`.
content_markdown: |-
  **Note:** If you update the service account key here, it will not be applied to the derived projects. Contact CloudHealth Support to apply the service account key to all the derived projects.
right_code_blocks:
  - code_block: |-
      {
        "cloudhealth_billing_account_id": <cloudhealth_billing_account_id>,
        "client_api_id": <client_api-id>,
        "billing_account_name": <billing_account_name>,
        "billing_account_id": <billing_account_id>,
        "bq_billing_dataset": <bq_billing_dataset>,
        "bq_billing_project": <bq_billing_project>,
        "bq_billing_activation_date": <bq_billing_activation_date>,
        "bq_billing_table": <bq_billing_table>,
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "cloudhealth_billing_account_id": "6116033430514",
        "billing_account_name": "Chayan Development BA",
        "billing_account_id": "00807B-DFFF5B-2DAAB8",
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
      '{
        "cloudhealth_billing_account_id": <cloudhealth_billing_account_id>,
        "client_api_id": <client_api-id>,
        "billing_account_name": <billing_account_name>,
        "billing_account_id": <billing_account_id>,
        "bq_billing_dataset": <bq_billing_dataset>,
        "bq_billing_project": <bq_billing_project>,
        "bq_billing_activation_date": <bq_billing_activation_date>,
        "bq_billing_table": <bq_billing_table>,
      }'
      'https://chapi.cloudhealthtech.com/v1/gcp_billing_accounts/<cloudhealth_billing_account_id>'
    title: Sample Request
    language: bash
---
