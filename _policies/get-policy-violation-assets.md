---
title: Get Single Policy Violation
position: 5
description: Retrieve a single policy violation and a list of all assets and resources affected by the violation.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/policies/:policy_id/policy_blocks/:policy_block_id/violations/:violation_id?api_key=:api access key&client_api_id=:client api Id&page=:page_number&per_page=:count_per_page
parameters:
  - name: api_key
    required: yes
    content: String that specifies the unique customer API Key, or Client API ID, that CloudHealth generates. Use this parameter if you are a partner who wants to retrieve a list of all policies belonging to a partner customer. See [How to Get Client API ID](#partner_how-to-get-client-api-id).
  - name: policy_id
    required: yes
    content: The policy ID of the policy. The policy ID can be retrieved using the [Get All Policies](#policies_get-all-policies) endpoint.
  - name: policy_block_id
    required: yes
    content: The policy block ID of the policy block. The policy block ID can be retrieved using the [Get All Policy Blocks](#policies_get-all-policy-blocks) endpoint.
  - name: violation_id
    required: yes
    content: The violation ID of the policy violation. The policy violation ID can be retrieved using the [Get All Policy Violations](#policies_get-all-policy-violations)
  - name: page
    required: no
    content: Specify the page number for results.
  - name: per_page
    required: no
    content: Specify how many results should be displayed per page. Default value is 100.
content_markdown: |-
  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `403 Forbidden`            | Missing API Key<br>Unable to find Client ID from Partner Customers<br>User does not have role permission to use this endpoint |
  | `404 Not Found`            | Violation ID or alert ID not found             |

right_code_blocks:
  - code_block: |-
      {
         "resource_type": "aws_s3_bucket",
         "comments": ["TestTestTest"]
         "affected_resources" : [
           {
             "id": 1,
             "New": false,
             "model_type": "S3 Bucket",
             "Name": "cloudhealth-detailed-bills",
             "Storage in GB": "1,142,023.68",
             "Account Name": "CloudHealth",
             "List Price in Month": "$34,260.71",
             "Access": "Not public *",
           },
           {
             "id": 2,
             "New": false,
             "model_type": "S3 Bucket",
             "Name": "cloudhealth-detailed-bills-dev",
             "Storage in GB": "604.35",
             "Account Name": "CloudHealth",
             "List Price in Month": "$18.13",
             "Access": "Not public *",
           },
           ...
         ],
         "_links": {
             "next": {
                 "href": "policy_violation/5841156436453?api_key=4760&page=2&per_page=33"
             }
         }
       }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET \
        'https://chapi.cloudhealthtech.com/v1/policies/<policy_id>/policy_blocks/<policy_block_id>/violations/<violation_id>?api_key=<client_api_id>&page=<page_number>&per_page=<count_per_page>' \
        -H 'Authorization: Bearer <your_api_key>'
        -H 'Content-Type: application/json'
    title: Sample Request
    language: bash
---
