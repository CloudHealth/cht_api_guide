---
title: Modify Existing Service Principal
position: 3
description: Modify a service principal that is already connected in the CloudHealth Platform. The `client_id`, `tenant_id` and `sp_type` parameters cannot be modified.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/azure_service_principals/:sp_id
parameters:
  - name: name
    required: yes
    content: String that specifies the name of the service principal.
  - name: client_secret
    required: yes
    content: The secret key for the client ID.
  - name: is_metrics_enabled
    required: no
    content: Boolean field that specifies whether metrics collection is enabled. Default value is `true`.
  - name: modify_sp_for_partner_customer
    required: no
    content: String that specifies the client API ID of the partner customer. Use this parameter only when modifying the service principal of a partner customer and partner in CloudHealth. For information on how to get this ID, see [How to Get Client API ID](#partner_how-to-get-client-api-id).
  - name: disable_assets_collection
    required: no
    content: JSON field that specifies whether to not collect data for specific assets. Enter `true` to disable asset collection for the specified asset. Default value for all assets is `false`.
right_code_blocks:
  - code_block: |-
      {
        "name": "Production SP 1",
        "client_secret": "cbdefeb",
        "is_metrics_enabled": true,
        "modify_sp_for_partner_customer": <client_api_id>
        "disable_assets_collection"             
        [{
          "AzureKeyVaultKey" : true,
          "AzureKeyVaultSecret": false
        }]
      }
    title: Request Body for Partner Customer
    language: json
  - code_block: |-
      {
        "name": "Production SP 1",
        "client_secret": "cbdefeb",
        "is_metrics_enabled": true,
        "disable_assets_collection"             
        [{
          "AzureKeyVaultKey": true,
          "AzureKeyVaultSecret": false
        }]
      }
    title: Request Body for Direct Customer
    language: json
  - code_block: |-
      {
        "id":1,
        "name": "Production SP 1",
        "sp_type":"global" ,
        "client_id": "xndencrnvcr",
        "tenant_id": "356dnsdn",
        "is_metrics_enabled": true,
        "created_at": "timestamp",
        "updated_at": "timestamp"
        "status" :[{                                           
          "status": "healthy",
          "status_at": "timestamp"
        }],
        "disable_assets_collection": [{              
          "AzureKeyVaultKey": true
        }]
      }
    title: Response Body for Direct Customer
    language: json
  - code_block: |-
      curl --request PUT -H 'Content-Type: application/json' -d
        '{
          "name": "Production SP 1",
          "client_secret": "cbdefeb",
          "is_metrics_enabled":true,
          "modify_sp_for_partner_customer": <client_api_id>
          "disable_assets_collection"             
          [{
            "AzureKeyVaultKey" : true,
            "AzureKeyVaultSecret":false
          }]
        }'
          'https://chapi.cloudhealthtech.com/v1/azure_service_principals/<sp_id>?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
