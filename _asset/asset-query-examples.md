---
title: Asset Query Examples
type: example
description: Multiple examples that demonstrate how you can use the Asset API.
position: 5
parameters:
  - name:
    content:
content_markdown: |-
    #### List API Names for All Asset Types
    ```
    curl "https://chapi.cloudhealthtech.com/api.json?
      api_key=<your_api_key>"
    ```

    #### List API Names for Available Fields for AWS RDS Instances
    ```
    curl "https://chapi.cloudhealthtech.com/api/AwsRdsInstance.json?
      api_key=<your_api_key>"
    ```

    #### List Available Fields for Azure Virtual Machines
    ```
    curl "https://chapi.cloudhealthtech.com/api/search.json?
      api_key=<your_api_key>"
      &name=AzureVm
    ```

    #### Filter RDS Instances by Instance ID
    ```
    curl "https://chapi.cloudhealthtech.com/api/search.json?
      api_key=<your_api_key>
      &name=AwsRdsInstance
      &instance_id=<instance_id>"
    ```

    #### Load Balancer Examples
    * Return Available Fields
      ```
      curl "https://chapi.cloudhealthtech.com/api/AwsLoadBalancer.json?
        api_key=<your_api_key>"
      ```
    * Unscoped Load Balancer Query
      ```
      curl "https://chapi.cloudhealthtech.com/api/search.json?
        api_key=<your_api_key>&name=AwsLoadBalancer"
      ```
    * Return ALB using `name` Filter
      ```
      curl "https://chapi.cloudhealthtech.com/api/search.json?
        api_key=<your_api_key>
        &name=AwsLoadBalancer
        &query=name='a45075013877811e7ad0b12129296f99'"
      ```
---
