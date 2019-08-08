---
title: Assign Account to Organization
position: 8
description: Assign accounts to an organization.
type: patch
endpoint: https://chapi.cloudhealthtech.com/v1/organizations/:org_id/accounts
parameters:
  - name: accounts
    required: yes
    content: Enter `add` to add new accounts to the organization.
  - name: aws_accounts
    required: no
    content: Enter a comma-separated list of AWS account IDs that should be assigned to the organization. The account IDs can be retrieved using the [Search for Assets](#asset_search-for-assets) endpoint. You can assign up to 500 AWS accounts per endpoint.
  - name: azure_subscriptions
    required: no
    content: Enter a comma-separated list of Azure subscription GUIDs that should be assigned to the organization. The subscription GUIDs can be retrieved using the [Search for Assets](#asset_search-for-assets) endpoint. You can assign up to 500 Azure accounts per endpoint.
  - name: gcp_compute_projects
    required: no
    content: Enter a comma-separated list of GCP project IDs that should be assigned to the organization. The project IDs can be retrieved using the [Search for Assets](#asset_search-for-assets) endpoint. You can assign up to 500 GCP projects per endpoint.
  - name: gcp_billing_accounts
    required: no
    content: Enter a comma-separated list of GCP billing account IDs that should be assigned to the organization. The account IDs can be retrieved using the [Search for Assets](#asset_search-for-assets) endpoint. You can assign up to 500 GCP accounts per endpoint.
  - name: data_center_accounts
    required: no
    content: Enter a comma-separated list of Data Center account names that should be assigned to the organization. The account names can be retrieved using the [Search for Assets](#asset_search-for-assets) endpoint. You can assign up to 500 Data Center accounts per endpoint.
right_code_blocks:
  - code_block: |-
      {
        "accounts":"add",
        "aws_accounts":["12345","67890"],
        "azure_subscriptions":["151f9055-7a93-4bbb","700f3a5c-8c56-44b9"],
        "gcp_compute_projects":["gcp-project-name","gcp-new-project"],
        "gcp_billing_accounts":["00807B-DFFF5B","013FE6-F0F952"]
        "data_center_accounts":["myplace-datacenter"]
      }
    title: Request Body
    language: json
  - code_block: |-
      [{
        "id":1,
        "name": "abc",
        "Description": "abc 123",
        "idp_name": "abc",
        "aws_accounts":["12345","67890"],
        "azure_subscriptions":["151f9055-7a93-4bbb","700f3a5c-8c56-44b9"],
        "gcp_compute_projects":["gcp-project-name","gcp-new-project"],
        "gcp_billing_accounts":["00807B-DFFF5B","013FE6-F0F952"]
        "data_center_accounts":["myplace-datacenter"]

      }]
    title: Response Body
    language: json
  - code_block: |-
      curl --request PATCH -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        '{
          "accounts":"add",
          "aws_accounts":["12345","67890"],
          "azure_subscriptions":["151f9055-7a93-4bbb","700f3a5c-8c56-44b9"],
          "gcp_compute_projects":["gcp-project-name","gcp-new-project"],
          "gcp_billing_accounts":["00807B-DFFF5B","013FE6-F0F952"]
          "data_center_accounts":["myplace-datacenter"]
        }'    
          'https://chapi.cloudhealthtech.com/v1/organizations/<org_id>/accounts'
    title: Sample Request
    language: bash
---
