---
title: Introduction to Partner API
position: 1
description: An introduction to the Partner API.
parameters:
  - name:
    content:
content_markdown: |-
  Partners and their customers are organized as tenants in a hierarchical, multi-tenant system in the Partner Platform. Customer tenants are subordinates of their corresponding Partner Tenant.

  ![](images/partner-cust-hier.png)

  The Partner API allows partners to get reports, metrics, and assets for their customers. In order to use the Partner API, you need to include an additional parameter, the `client_api_id`, with each request. CloudHealth generates a unique ID for each partner customer.
---
