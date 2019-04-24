---
title: Create CSP Partner Customer
position: 3
description: Add a Microsoft CSP partner customer tenant in the CloudHealth Platform.
type: post
endpoint: https://chapi.cloudhealthtech.com/v2/customers
parameters:
  - name: name
    required: yes
    content: String that specifies the unique display name of the customer's Azure account.
  - name: azure_customer_id
    required: no
    content: The Azure customer ID of the customer tenant. Use this parameter when the customer tenant has an address entered in the Azure Portal. If the customer tenant does not have an address entered in the Azure Portal, replace the `azure_customer_id` parameter with the `address` parameter.  
  - name: address
    required: no
    content: JSON field that specifies the customer's mailing address. Use this parameter when the customer tenant does not have an address entered in the Azure Portal. If the customer tenant has an address entered in the Azure Portal, use the `azure_customer_id` instead.
    sub-fields:
      - name: street1
        required: yes
        content: Line 1 of street address
      - name: street2
        required: no
        content: Line 2 of street address. Can be blank.
      - name: city
        required: yes
        content: City specified as a string
      - name: state
        required: yes
        content: State specified in abbreviated form. For example, specify Massachusetts as `MA`. For non-US countries, use the full, ASCII-transliterated state names. For example, for Australian state names, specify `Australian Capital Territory`, `New South Wales`, `Northern Territory`, and so on.
      - name: zipcode
        required: yes
        content: Zipcode specified as a number
      - name: country
        required: yes
        content: Country specified a string
  - name: classification
    required: no
    content: String that specifies the level of access the customer has in the CloudHealth Platform. Specify as `managed_without_access` (managed customer that does not directly access the CloudHealth Platform) or `managed_with_access` (managed customer that directly accesses the CloudHealth Platform). The default value is `managed_without_access'.
  - name: trial_expiration_date
    required: no
    content: Date specified in ISO8601 format that indicates a date in the future when the customer's trial expires. Beyond this date, users belonging to the customer are unable to access the CloudHealth Platform.
  - name: billing_contact
    required: no
    content: String that specifies the email address of customer contact.
  - name: partner_billing_configuration
    required: no
    content: Composite JSON field that specifies the configuration for the partner billing engine.
    sub-fields:
      - name: enabled
        required: yes
        content: Boolean field that specifies whether partner billing is enabled. Default value is `false`.
      - name: folder
        required: no
        content: String that specifies the prefix of the S3 folder that contains processed customer bills.
  - name: tags
    required: no
    content: JSON array that specifies key-value pairs for tags to attach to the customer. Each customer can be assigned a maximum of 20 tags.
    sub-fields:
      - name: key
        required: yes
        content: Tag key
      - name: value
        required: yes
        content: Tag value
content_markdown: |-
  | Response Code              | Description              |
  | -------------------------- | ------------------------ |
  | `201 OK`                   | Operation was successful |
  | `422 Unprocessable Entity` | Unprocessable entity     |
  | `401 Unauthorized`         | Unauthorized entry       |
  | `422 Unprocessable Entry`  | Input format errors      |
  | `500 Internal Service Error` | Internal service error |

right_code_blocks:
  - code_block: |-
      {
       "name":"abc company",
       "azure_customer_id":"34fdg",
       "classification":"managed_with_access",
       "trial_expiration_date":"date",

       "billing_contact":"abc",
       "partner_billing_configuration":{
        "enabled":true,
        "folder":"",
       }
       "tags": [{
               "key": "customer_id", "value": "973532"
               },
              {
          "key": "service_package", "value": "basic_managed"
           }]
      }
    title: Request Body with azure_customer_id Parameter
    language: json
  - code_block: |-
      {
        "name": "Acme Corp",
        "classification": "managed_without_access",
        "billing_contact": "john.doe@acmecorp.com",
        "trial_expiration_date": "2016-09-22T00:00:00Z",
        "partner_billing_configuration": {
          "enabled": "true",
          "folder": ""
        },
        "address": {
          "street1": "1 Main St",
          "city": "Springfield",
          "state": "MA",
          "zipcode": "01234",
          "country": "US"
        },
        "tags": [{
          "key": "customer_id", "value": "973532"
        },
        {
          "key": "service_package", "value": "basic_managed"
        }]
      }
    title: Response Body with address Parameter
    language: json
  - code_block: |-
      {
        "id": 3947,
        "name": "Acme Corp",
        "classification": "managed_without_access",
        "billing_contact": "john.doe@acmecorp.com",
        "margin_percentage": 0.0,
        "created_at": "2016-09-15T18:17:04Z",
        "updated_at": "2016-09-15T18:17:04Z",
        "generated_external_id": "1a2b3c4d5e6f",
        "partner_billing_configuration": {
          "enabled": true,
          "folder": ""
        },
        "address": {
          "street1": "1 Main St",
          "city": "Springfield",
          "state": "MA",
          "zipcode": "01234",
          "country": "US"
        },
        "tags": [{
          "key": "customer_id", "value": "973532"
          },
          {
          "key": "service_package", "value": "basic_managed"
          }
        ],
      "_links": {
        "self": {
        "href": "/v1/customers/3947"
        }
        }
      }
    title: Response Body
    language: json
  - code_block: |-
      curl -d
        '{
           "name":"abc company",
           "azure_customer_id":"34fdg",
           "classification":"managed_with_access",
           "trial_expiration_date":"date",

           "billing_contact":"abc",
           "partner_billing_configuration":{
            "enabled":true,
            "folder":"",
           }
           "tags": [{
                   "key": "customer_id", "value": "973532"
                   },
                  {
              "key": "service_package", "value": "basic_managed"
               }]
              }'
            -H 'Content-Type: application/json' --request POST 
          'https://chapi.cloudhealthtech.com/v2/customers?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
