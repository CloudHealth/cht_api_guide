---
title: Get All Policy Blocks
position: 3
description: Retrieve a list of all policy blocks for a policy.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/policies/:policy_id/policy_blocks
parameters:
  - name: policy_id
    required: yes
    content: The policy ID of the policy. The policy ID can be retrieved using the [Get All Policies](#policies_get-all-policies) endpoint.
  - name: api_key
    required: no
    content: String that specifies the unique customer API Key, or Client API ID, that CloudHealth generates. Use this parameter if you are a partner who wants to retrieve a list of all policies belonging to a partner customer. See [How to Get Client API ID](#partner_how-to-get-client-api-id).
  - name: per_page
    required: no
    content: Specify how many results should be displayed per page. Default value is 30.
  - name: page
    required: no
    content: Specify the page number for results.
content_markdown: |-
  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `403 Forbidden`            | Missing API Key<br>Unable to find Client ID from Partner Customers<br>User does not have role permission to use this endpoint |
  | `404 Not Found`            | Policy ID not found<br>Policy ID corresponds to a rightsizing policy. Policy API cannot retrieve policy blocks for a rightsizing policy.             |
  | `422 Unprocessable Entity` | Exceeded maximum 30 per page<br>Page parameters must be greater than zero     |
right_code_blocks:
  - code_block: |-
      {
        "policy_blocks":[
          { "id": 1511828492778, "name": "Block 1", "last_evaluated": "2019-05-28 11:11:23 UTC"},
          { "id": 1511828492779, "name": "Block 2", "last_evaluated": "2019-05-28 11:11:23 UTC"},
          { "id": 1511828492780, "name": "Block 3", "last_evaluated": "2019-05-28 11:11:23 UTC"},
          { "id": 1511828492781, "name": "Block 4", "last_evaluated": "2019-05-28 11:11:23 UTC"},
          { "id": 1511828492782, "name": "Block 5", "last_evaluated": "2019-05-28 11:11:23 UTC"}
        ],
        "_links": {}
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET \
        'https://chapi.cloudhealthtech.com/v1/policies/<policy_id>/policy_blocks?api_key=<client_api_id>&per_page=<max_page_count>&page=<page_number>' \
        -H 'Authorization: Bearer <your_api_key>'
        -H 'Content-Type: application/json'
    title: Sample Request
    language: bash
---
