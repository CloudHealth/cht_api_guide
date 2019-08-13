---
title: How to Use the Client API ID with Customer API
category: partner
position: 3
parameters:
  - name:
    content:
content_markdown: |-
  The Client API ID is an ID assigned to each partner customer. As a partner, you can use your partner customer's Client API ID with customer API endpoints to add, remove and view information about your partner customer.

  For example, you can use a partner customer's Client API ID to get a list of queryable reports belonging to that partner customer with the [List of Queryable Reports](#reporting_list-of-queryable-reports) endpoint.

  To get a partner customer's Client API ID, see the [How to Get Client API ID](#partner_how-to-get-client-api-id) topic.

  The Client API ID is added to the end of a customer API endpoint. For example:

  ```
  https://chapi.cloudhealthtech.com/v1/perspective_schemas?client_api_id=<client_api_id>
  ```  
---
