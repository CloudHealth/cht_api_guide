---
title: How to Get Service Principal ID
position: 2
content_markdown: |-
  In order to use some of the Azure Service Principal endpoints, you need to provide the `sp_id`. CloudHealth generates a unique ID for each service principal.

  You can get the Service Principal ID for a customer's service principal from the CloudHealth Platform. From the left menu, go to **Setup > Accounts > Azure Service Principal** and open the service principal. The ID of the service principal appears in the browser URL. Here's an example URL:
  ```
  https://apps.cloudhealthtech.com/azure_service_principals/33672XXXXXX68
  ```

  Here, `33672XXXXXX68` is the service principal ID.

  The Service Principal ID can also be retrieved using the [Get All Existing Service Principals endpoint](#service-principal_get-all-existing-service-principals).
---
