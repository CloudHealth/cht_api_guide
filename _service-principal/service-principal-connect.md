---
title: Connect Service Principal in CloudHealth
position: 2
description: Connect a service principal to a customer, partner customer, and/or partner in the CloudHealth Platform.
type: post
endpoint: https://chapi.cloudhealthtech.com/v1/azure_service_principals
parameters:
  - name: name
    required: yes
    content: String that specifies the name of the service principal.
  - name: client_id
    required: yes
    content: The client ID, or application ID, registered with the service principal.
  - name: client_secret
    required: yes
    content: The secret key for the client ID.
  - name: tenant_id
    required: yes
    content: The tenant ID, or directory ID, of the customer tenant.
  - name: sp_type
    required: no
    content: JSON field that specifies whether the service principal type is `global` or `govcloud`. Default value is `global`.
  - name: is_metrics_enabled
    required: no
    content: Boolean field that specifies whether metrics collection is enabled. Default value is `true`.
  - name: disable_assets_collection
    required: no
    content: JSON field that specifies whether to not collect data for specific assets. Enter `true` to disable asset collection for the specified asset. Default value for all assets is `false`.
    sub-fields:
      - name: AzureActiveDirectoryRoleDefinition
        required: no
        content: Boolean field that specifies whether to not collect data for the Azure Active Directory Role Definition asset. Default value is `false`.
      - name: AzureActiveDirectoryUser
        required: no
        content: Boolean field that specifies whether to not collect data for the Azure Active Directory Users asset. Default value is `false`.
      - name: AzureKeyVaultKey
        required: no
        content: Boolean field that specifies whether to not collect data for the Azure Key Vault Keys asset. Default value is `false`.
      - name: AzureKeyVaultSecret
        required: no
        content: Boolean field that specifies whether to not collect data for the Azure Key Vault Secrets asset. Default value is `false`.
      - name: AzureSqlDatabaseAuditing
        required: no
        content: Boolean field that specifies whether to not collect data for the Azure Sql Database Auditing asset. Default value is `false`.
      - name: AzureSqlDatabaseThreatDetection
        required: no
        content: Boolean field that specifies whether to not collect data for the Azure Sql Database Threat Detection asset. Default value is `false`.
      - name: AzureSqlServerAuditing
        required: no
        content: Boolean field that specifies whether to not collect data for the Azure Sql Server Auditing asset. Default value is `false`.
      - name: AzureSqlServerFirewallRule
        required: no
        content: Boolean field that specifies whether to not collect data for the Azure SQL Server Firewall Rule asset. Default value is `false`.
      - name: AzureSqlServerThreatDetection
        required: no
        content: Boolean field that specifies whether to not collect data for the Azure Sql Server Threat Detection asset. Default value is `false`.
      - name: AzureSubscriptionSecurityPolicy
        required: no
        content: Boolean field that specifies whether to not collect data for the Azure Subscription Security Policy asset. Default value is `false`.
  - name: create_sp_for_partner_customer
    required: no
    content: String that specifies the client API ID of the partner customer. Use this parameter only when connecting the service principal to a partner customer and partner in CloudHealth. For information on how to get this ID, see [How to Get Client API ID](#partner_how-to-get-client-api-id).
right_code_blocks:
  - code_block: |-
      {
        "name": "Production SP",
        "sp_type": "govcloud"  ,
        "client_id": "xndencrnvcr",
        "client_secret": "cbdefeb",
        "tenant_id": "356dnsdn",
        "is_metrics_enabled": false,
        "disable_assets_collection": [{
          "AzureKeyVaultKey": true,
          "AzureKeyVaultSecret": true
          }],     
        "create_sp_for_partner_customer": <client_api_id>
      }
    title: Request Body for Partner Customer
    language: json
  - code_block: |-
      {
        "name": "Production SP",
        "sp_type": "govcloud"  ,
        "client_id": "xndencrnvcr",
        "client_secret": "cbdefeb",
        "tenant_id": "356dnsdn",
        "is_metrics_enabled": false,
        "disable_assets_collection": [{
          "AzureKeyVaultKey": true,
          "AzureKeyVaultSecret": true
          }],     
      }
    title: Request Body for Direct Customer
    language: json
  - code_block: |-
      {
        "id": 1,
        "name": "Production SP",
        "sp_type": "govcloud" ,
        "client_id": "xndencrnvcr",
        "tenant_id": "356dnsdn",   
        "is_metrics_enabled": false,
        "created_at": "timestamp",
        "updated_at": "timestamp"
        "status" :[{
          "status": "healthy",
          "status_at": "timestamp"
          }],  
        "disable_assets_collection": [{              
          "AzureKeyVaultKey": true,                
          "AzureKeyVaultSecret": true
          }]
      },

      {
        "id": 2,
        "name": "Production SP",
        "sp_type": "govcloud" ,
        "client_id": "xndencrnvcr",
        "tenant_id": "356dnsdn",   
        "is_metrics_enabled": false,
        "created_at": "timestamp",
        "updated_at": "timestamp"
        "status" :[{
          "status": "healthy",
          "status_at": "timestamp"
          }],
        "disable_assets_collection": [{               
          "AzureKeyVaultKey": true,              
          "AzureKeyVaultSecret": true
          }]
      }
    title: Response Body for Direct Customer
    language: json
  - code_block: |-
      curl --request POST -H 'Content-Type: application/json' -d
        '{
          "name": "Production SP",
          "sp_type": "govcloud"  ,
          "client_id": "xndencrnvcr",
          "client_secret": "cbdefeb",
          "tenant_id": "356dnsdn",
          "is_metrics_enabled": false,
          "disable_assets_collection": [{
            "AzureKeyVaultKey": true,
            "AzureKeyVaultSecret": true
            }],     
          "create_sp_for_partner_customer": <client_api_id>
        }'
          'https://chapi.cloudhealthtech.com/v1/azure_service_principals?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
