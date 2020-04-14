---
title: Create Organization
position: 4
description: Add a new organization to the CloudHealth Platform.
type: post
endpoint: https://chapi.cloudhealthtech.com/v2/organizations
parameters:
  - name: name
    required: yes
    content: String that specifies the unique name of the new organization.
  - name: description
    required: no
    content: String that specifies a description of the organization.
  - name: parent_organization_id
    required: no
    content: String that specifies the ID of the parent organization. Applies only for organizations in FlexOrgs.
right_code_blocks:
  - code_block: |-
      {
        "name": "abc",
        "description": "abc desc"
        "parent_organization_id": "24"
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "id":6116033432624
        "parent_organization_id": "24",
        "name": "abc",
        "description": "abc desc",
        "idp_name": "abc",
        "flex_org": false,
        "default_organization": true,
        "assigned_users_count": 124,
        "num_aws_accounts": 118,
        "num_azure_subscriptions": 25,
        "num_gcp_compute_projects": 15,
        "num_data_center_accounts": 84,
        "num_vmware_csp_organizations": 1
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request POST -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        '{
          "name": "abc",
          "description": "abc desc"
          "parent_organization_id": "24"
        }'    
          'https://chapi.cloudhealthtech.com/v2/organizations'
    title: Sample Request
    language: bash
---
