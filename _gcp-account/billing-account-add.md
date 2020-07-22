---
title: Enable GCP Billing Account
position: 5
description: Enable a GCP billing account for a direct customer or a partner customer in the CloudHealth Platform.
type: post
endpoint: https://chapi.cloudhealthtech.com/v1/gcp_billing_accounts
parameters:
  - name: client_api_id
    required: no
    content: The client API ID of the partner customer whose billing account is being added. Required for partners configuring a partner customer's billing account.
  - name: billing_account_name
    required: yes
    content: String that specifies the unique display name of the customer's billing account.
  - name: billing_account_id
    required: yes
    content: The GCP billing account ID of the billing account in the Google Console.   
  - name: bq_billing_dataset
    required: yes
    content: String that specifies the BigQuery billing dataset name.
  - name: bq_billing_project
    required: yes
    content: String that specifies the BigQuery billing project ID.
  - name: bq_activation_date
    required: yes
    content: Date in `YYYY-MM-DD` format that specifies the BigQuery activation date. To locate the activation date, run the following query in the BigQuery Query Editor, replacing `insert_table_name` with the BigQuery table name - `SELECT min(export_time) FROM insert_table_name`.
  - name: bq_billing_table
    required: no
    content: String that specifies the name of the BigQuery billing table. By default, the customer-owned BigQuery table is used. If you are a partner enabling a partner customer GCP billing account, you should assign the partner-owned BigQuery table, not the customer-owned table.
  - name: billing_bucket
    required: yes
    content: String that specifies the name of the billing bucket that contains the GCP billing export for the billing account.
  - name: billing_bucket_prefix
    required: yes
    content: String that specifies the report prefix for the billing bucket.
  - name: billing_account_service_account
    required: yes
    content: String that specifies the GCP service account associated with the billing account.
  - name: billing_account_service_account_json_key
    required: no
    content: Enter the service account’s private JSON key in the format `data:application/json;base64, <private JSON key>`.
  - name: linked_projects_service_account
    required: no
    content: String that specifies the second GCP service account associated with the billing account, if applicable. To ensure that the minimum set of permissions are used, some customers might prefer to use two service accounts for CloudHealth, one for billing data and one for asset and rightsizing data. CloudHealth recommends that partners use two service accounts for their partner customers, with the billing data service account owned by the partner and the asset and rightsizing data service account owned by the partner customer.
  - name: linked_projects_json_key
    required: no
    content: Enter the second service account’s private JSON key in the format `data:application/json;base64, <private JSON key>`.
content_markdown: |-
  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `422 Unprocessable Entity` | Unprocessable entity     |
  | `401 Unauthorized`         | Unauthorized entry       |
  | `403 Forbidden`            | Invalid Client API ID    |
  | `422 Unprocessable Entry`  | Input format errors      |
  | `500 Internal Service Error` | Internal service error |
right_code_blocks:
  - code_block: |-
      {
        "billing_account_name": <billing_account_name>,
        "billing_account_id": <billing_account_id>,
        "bq_billing_dataset": <bq_billing_dataset>,
        "bq_billing_project": <bq_billing_project>,
        "bq_billing_activation_date": <bq_billing_activation_date>,
        "billing_bucket": <billing_bucket>,
        "billing_bucket_prefix": <billing_bucket_prefix>,
        "billing_account_service_account": <billing_account_service_account>,
        "billing_account_service_account_json_key": <billing_account_service_account_json_key>,
        "linked_projects_service_account" : <linked_projects_service_account>,
        "linked_projects_json_key": <linked_projects_json_key>
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "cloudhealth_billing_account_id": "6116033430514",
        "billing_account_name": "Chayan Test BA",
        "billing_account_id": "00807B-DFFF5B-2DAAB8",
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request POST -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        '{
          "billing_account_name": <billing_account_name>,
          "billing_account_id": <billing_account_id>,
          "bq_billing_dataset": <bq_billing_dataset>,
          "bq_billing_project": <bq_billing_project>,
          "bq_billing_activation_date": <bq_billing_activation_date>,
          "billing_bucket": <billing_bucket>,
          "billing_bucket_prefix": <billing_bucket_prefix>,
          "billing_account_service_account": <billing_account_service_account>,
          "billing_account_service_account_json_key": <billing_account_service_account_json_key>,
          "linked_projects_service_account" : <linked_projects_service_account>,
          "linked_projects_json_key": <linked_projects_json_key>
        }'
          'https://chapi.cloudhealthtech.com/v1/gcp_billing_accounts'
    title: Sample Request
    language: bash
---
