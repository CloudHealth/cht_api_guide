---
title: Add Dimensions and Measures to Report Query
type: example
description: Customize the granularity of report data by building complex queries that employ measures, dimensions, and filters. This example shows how to build a complex query to get the EC2 Compute Cost by Availability Zone for a monthly granularity.
position: 12
parameters:
  - name:
    content:
content_markdown: |-
    1. Retrieve the list of available measures and dimensions of for the EC2 Instance Report.
       `curl -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json' "https://chapi.cloudhealthtech.com/olap_reports/usage/instance/new"`

       This query returns a response that looks like this.

       ```
       {
       "dimensions": [
          {
              "label": "Owner Perspective",
              "name": "Groupset-998"
              "members": [...],
          },
          {
              "label": "Function Perspective",
              "name": "Groupset-999"
              "members": [...],
         },
         {
              "label": "Availability Zones",
              "name": "AWS-Availaibility-Zones"
              "members": [
                  {
                      "label": "us-east-1a",
                      "name": "us-east-1a"
                  },
                  ...
              ],
          },
          {
              "label": "Days",
              "name": "time"
              "members": [
                  {
                      "label": "2018-01-10",
                      "name": "1"
                  },
                  ...
              ],
          }
          ...
      ],
      "measures": [
          {
              "label": "# Instances",
              "name": "usage_quantity"
          },
          {
              "label": "Total Cost ($)",
              "name": "cost"
          },
          {
              "label": "Compute Cost ($)",
              "name": "ec2_cost_compute"
          },
          {
              "label": "Transfer Cost ($)",
              "name": "ec2_cost_transfer"
          },
          {
              "label": "# Reservations",
              "name": "count"
          },
          {
              "label": "On-Demand Cost ($)",
              "name": "ec2_cost_on_demand"
          },
          {
              "label": "# Instance Hours",
              "name": "instance_hours"
          }
        ]
      }
       ```
    2. Build a complex query that gets the EC2 Compute Cost by Availability Zone for a monthly granularity.

       For each dimension, add a query  parameter called `dimensions[]` and for each measure add a parameter called `measures[]`. For each of these parameters, specify one or more values that you received when querying the `/new` endpoint. In general, the dimensions available are `hourly`, `daily`, `weekly`, and `monthly`. You can add up to 4 dimensions.

       ```
       curl -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json' 'https://chapi.cloudhealthtech.com/olap_reports/usage/instance?
        dimensions[]=time
        &dimensions[]=AWS-Availaibility-Zones
        &measures[]=ec2_cost_compute
        &interval=monthly'
       ```
---
