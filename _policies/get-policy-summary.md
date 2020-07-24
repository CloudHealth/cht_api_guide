---
title: Get All Policies
position: 2
description: Retrieve a list of all policies in your organization or in the specified partner customer's default organization.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/policies
parameters:
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
  | `403 Forbidden`                   | Missing API Key<br>Unable to find Client ID from Partner Customers<br>User does not have role permission to use this endpoint |
  | `422 Unprocessable Entity` | Exceeded maximum 30 per page<br>Page parameters must be greater than zero     |
right_code_blocks:
  - code_block: |-
      {
        "policies": [
          {  
            "id": 152,
            "name": "Missing cht_owner Tag",
            "description": "A block for each asset type",
            "user_defined": true,
            "creator": "John Doe",
            "creator_email": "jdoe@cloudhealthtech.com",
            "last_editor": "John Doe",
            "last_editor_email": "jdoe@cloudhealthtech.com",
            "enabled": true,
            "last_evaluation": "2019-05-23 20:19:42 UTC",
            "created_at": "2017-08-02 17:39:56 UTC",
          },
          {
            "id": 151,
            "name": "CIS AWS Foundations",
            "description": "Center for Internet Security (CIS) security benchmark providing best practices securing AWS environments. This policy can be used to validate your adherence to important security recommendations.",
            "user_defined": true,
            "creator": null,
            "creator_email": null,
            "last_editor": null,
            "last_editor_email": null,
            "enabled":true,
            "last_evaluation": "2019-05-23 20:19:42 UTC",
            "created_at": "2016-11-28 03:57:14 UTC"
          }
      ],
      "_links" : {
          "next" : {
              "href": "cloudhealthtech.com/v1/policies?api_key=4760&per_page=20&page=3"
          },
          "prev" : {
              "href": "cloudhealthtech.com/v1/policies?api_key=4760&per_page=20&page=1"
          }
        }
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request GET \
        'https://chapi.cloudhealthtech.com/v1/policies?api_key=<client_api_id>&per_page=<max_page_count>&page=<page_number>' \
        -H 'Authorization: Bearer <your_api_key>'
        -H 'Content-Type: application/json'
    title: Sample Request
    language: bash
---
