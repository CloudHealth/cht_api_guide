---
title: Asset Query Examples
type: example
description: Multiple examples that demonstrate how you can use the Asset API.
position: 5
parameters:
  - name:
    content:
content_markdown: |-
    #### List API names for all asset types
    ```
    curl -H 'Authorization: Bearer <your_api_key>'
      "https://chapi.cloudhealthtech.com/api"
    ```

    #### List available fields for AWS RDS Instances
    ```
    curl -H 'Authorization: Bearer <your_api_key>'
      "https://chapi.cloudhealthtech.com/api/AwsRdsInstance"
    ```

    #### List available fields for Azure Virtual Machines
    ```
    curl -H 'Authorization: Bearer <your_api_key>'
      "https://chapi.cloudhealthtech.com/api/AzureVm"
    ```

    #### List available fields for AWS Load Balancer
    ```
    curl -H 'Authorization: Bearer <your_api_key>'
      "https://chapi.cloudhealthtech.com/api/AwsLoadBalancer"
    ```

    #### Filter AWS Load Balancers by name
    ```
    curl -H 'Authorization: Bearer <your_api_key>' "https://chapi.cloudhealthtech.com/api/search?
      &name=AwsLoadBalancer
      &query=name='a45075XXXXXXYYYYYYZZZZZ96f99'"
    ```

    #### Filter RDS Instances by instance ID and only display the instance IDs in the response
    ```
    curl -H 'Authorization: Bearer <your_api_key>' "https://chapi.cloudhealthtech.com/api/search?
      &name=AwsRdsInstance
      &api_version=2
      &fields=instance_id
      &instance_id=<instance_id>"
    ```

    #### List active AWS Volumes and only display their Perspective Groups and Accounts in the response
    ```
    curl -H 'Authorization: Bearer <your_api_key>' https://chapi.cloudhealthtech.com/api/search?
      &api_version=2
      &page=1
      &per_page=5
      &query=is_active=1
      &name=AwsVolume
      &fields=in_use,attr_group__33XXSSDDYYYY,account.name
    ```

    #### Include only instance as related object when searching for AWS Volumes
    ```
    curl -H 'Authorization: Bearer <your_api_key>' 'https://chapi.cloudhealthtech.com/api/search?
      &api_version=2
      &page=1
      &per_page=5
      &name=AwsVolume
      &include=instance
    ```
---
