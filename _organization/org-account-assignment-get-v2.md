---
title: Get Organization Account Assignment
position: 9
description: Retrieve a list of all accounts assigned to an organization.
type: get
endpoint: https://chapi.cloudhealthtech.com/v2/organizations/:org_id/:cloud_account
parameters:
  - name: cloud_account
    required: yes
    content: Specify the cloud account as `aws_accounts` for AWS, `azure_subscriptions` for Azure, `gcp_compute_projects` for GCP, `data_center_accounts` for Data Center, or `vmware_csp_organizations` for VMware Cloud.
  - name: page
    required: no
    content: Specify the page number for results.
  - name: per_page
    required: no
    content: Specify how many results should be displayed per page. Default value is 30. Maximum value is 100.
  - name: query
    required: no
    content: Specify a keyword to filter accounts by. For example, specify `Production` to filter accounts by field and tag for the keyword Production.
  - name: sort
    required: no
    content: Specify an attribute to sort accounts by. For example, specify `amazon_name` to sort accounts by the Amazon Name attribute.
  - name: is_down
    required: no
    content: Boolean field that specifies whether accounts should be sorted in ascending or descending order. Specify `true` to sort accounts in descending order and `false` to sort accounts in ascending order. Default value is `false`.

right_code_blocks:
  - code_block: |-
      {
      "accounts": [
        {
          "name": "Example Subscription",
          "region": "global",
          "created_at": "2017-10-19T17:36:10Z",
          "updated_at": "2019-04-03T04:49:49Z",
          "account_type": "Unknown",
          "status": "Critical",
          "authentication_type": "Role Based",
          "tags": []
        },
        {
          "name": "Production Account",
          "region": "global",
          "created_at": "2018-05-02T05:51:20Z",
          "updated_at": "2018-05-04T16:36:55Z",
          "account_type": "Unknown",
          "status": "Critical",
          "authentication_type": "User Based",
          "tags": [
            {
              "key": "Environment",
              "value": "Production"
            }
          ]
        }
      ],
      "_links": {
          "next": {
            "href": "/v2/organizations/:org_id/aws_accounts?page=2&per_page=30"
          }
        }
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d  
          'https://chapi.cloudhealthtech.com/v2/organizations/<org_id>/<cloud_account>'
    title: Sample Request
    language: bash
---
