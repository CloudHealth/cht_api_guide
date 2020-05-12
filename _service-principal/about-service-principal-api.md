---
title: Introduction to Azure Service Principal API
position: 1
description: An introduction to the Azure Service Principal API.
parameters:
  - name:
    content:
content_markdown: |-
  The Azure service principal defines the access an application such as CloudHealth has to your Azure Portal data. Use this API to connect an Azure service principal to the CloudHealth Platform.

  Depending on your account type, you need to complete different kinds of setup prior to using the Azure service principal API.
  * Enterprise Agreement/GovCloud direct customer:
    * Complete steps 1-5 in the [Enable Azure Accounts in CloudHealth](https://help.cloudhealthtech.com/administration/config-ea-azure-account) topic.
    * Replace step 6 with the [Connect Service Principal endpoint](#service-principal_connect-service-principal-in-cloudhealth).
  * Pay As You Go direct customer:
    * Complete steps 1-2 in the [Enable Azure Accounts in CloudHealth](https://help.cloudhealthtech.com/administration/config-payg-azure-account) topic.
    * Replace step 3 with the [Connect Service Principal endpoint](#service-principal_connect-service-principal-in-cloudhealth).
  * Partner customer:
    * Complete steps 1-2 in the [Configure Microsoft CSP Partner Customer](https://help.cloudhealthtech.com/partners/configure-microsoft-csp-partners-and-customers#config-csp-cust-account) topic.
    * Replace steps 3 and 4 with the [Connect Service Principal endpoint](#service-principal_connect-service-principal-in-cloudhealth) to connect the service principal with both the partner and the partner customer.

  The Azure Service Principal API allows direct customers, partners, and partner customers to connect their service principal to CloudHealth. partners to get reports, metrics, and assets for their customers. In order to use some of the Azure Service Principal endpoints, you need to provide the `sp_id`. CloudHealth generates a unique ID for each service principal. See [How to Get Service Principal ID](#service-principal_how-to-get-service-principal-id).
---
