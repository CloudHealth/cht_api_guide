---
title: Add Filters to Report Query
type: example
description: Use filters in conjunction with dimensions and measures to build complex queries.
position: 10
parameters:
  - name:
    content:
content_markdown: |-
    Report filters help you reduce the data that is returned by a report query. You can use filters in conjunction with dimensions and measures to build complex queries.

    For example, to get the EC2 Compute Cost in `us-east-1a`, you can apply a filter in this way.
    ```
    curl -H "Accept: application/json" 'https://chapi.cloudhealthtech.com/olap_reports/usage/instance?
      dimensions[]=time
      &dimensions[]=AWS-Availaibility-Zones
      &measures[]=ec2_cost_compute
      &filters\[\]=AWS-Availaibility-Zones:select:us-east-1a
      &interval=monthly
      &api_key=<your_api_key>
    ```

    In the query, each filter is represented using the `filters[]` parameter. this parameter has the this structure.
    `dimension-name:select|reject:member-name,member-name`

    The `select` operator indicates which dimension members that you want to include and the `reject`, the dimension members that you want to exclude.

    For example, to get the EC2 Compute Costs for all Availability Zones except `us-east-1b` and `us-east-1d`, you can apply a filter in this way.
    ```
    curl -H "Accept: application/json" 'https://chapi.cloudhealthtech.com/olap_reports/usage/instance
      ?dimensions[]=time
      &dimensions[]=AWS-Availaibility-Zones
      &measures[]=ec2_cost_compute
      &filters\[\]=AWS-Availaibility-Zones:reject:us-east-1b,us-east-1d
      &interval=monthly
      &api_key=<your_api_key>'
    ```

    For more information on how to filter by time, see [Understand Time Filters](#Reportingunderstand-time-filters).
---
