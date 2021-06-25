---
title: Replace Existing Organization Account Assignment
position: 11
description: Replace an organization's current account assignments with a new list of accounts. This endpoint removes all accounts currently assigned to the organization and replaces them with the new accounts.
type: put
endpoint: https://chapi.cloudhealthtech.com/v2/organizations/:org_id/accounts
parameters:
  - name: aws_accounts
    required: no
    content: Enter a comma-separated list of AWS account IDs (also known as the owner ID) that should be assigned to the organization. The account IDs can be retrieved using the [Search for Assets](#asset_search-for-assets) endpoint. You can assign up to 500 AWS accounts per endpoint.
  - name: azure_subscriptions
    required: no
    content: Enter a comma-separated list of Azure subscription GUIDs that should be assigned to the organization. The subscription GUIDs can be retrieved using the [Search for Assets](#asset_search-for-assets) endpoint. You can assign up to 500 Azure accounts per endpoint.
  - name: gcp_compute_projects
    required: no
    content: Enter a comma-separated list of GCP project IDs that should be assigned to the organization. The project IDs can be retrieved using the [Search for Assets](#asset_search-for-assets) endpoint. You can assign up to 500 GCP projects per endpoint.
  - name: data_center_accounts
    required: no
    content: Enter a comma-separated list of Data Center account names that should be assigned to the organization. The account names can be retrieved using the [Search for Assets](#asset_search-for-assets) endpoint. You can assign up to 500 Data Center accounts per endpoint.
right_code_blocks:
  - code_block: |-
      {
        "aws_accounts":["12345","67890"],
        "azure_subscriptions":["151f9055-7a93-4bbb","700f3a5c-8c56-44b9"],
        "gcp_compute_projects":["gcp-project-name","gcp-new-project"],
        "data_center_accounts":["myplace-datacenter"]
      }
    title: Request Body
    language: json
  - code_block: |-
      [{
        "id":"6116033432624",
        "name": "abc",
        "description": "abc 123",
        "idp_name": "abc",
        "flex_org": false,
        "default_organization": true,
        "assigned_users_count": 124,
        "num_aws_accounts": 118,
        "num_azure_subscriptions": 25,
        "num_gcp_compute_projects": 15,
        "num_data_center_accounts": 84,
        "num_vmware_csp_organizations": 1
      }]
    title: Response Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        '{
          "aws_accounts":["12345","67890"],
          "azure_subscriptions":["151f9055-7a93-4bbb","700f3a5c-8c56-44b9"],
          "gcp_compute_projects":["gcp-project-name","gcp-new-project"],
          "data_center_accounts":["myplace-datacenter"]
        }'    
          'https://chapi.cloudhealthtech.com/v2/organizations/<org_id>/accounts>'
    title: Sample Request
    language: bash
---
