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
    curl "https://chapi.cloudhealthtech.com/api?
      &api_key=<your_api_key>"
    ```

    #### List available fields for AWS RDS Instances
    ```
    curl "https://chapi.cloudhealthtech.com/api/AwsRdsInstance?
      &api_key=<your_api_key>"
    ```

    #### List available fields for Azure Virtual Machines
    ```
    curl "https://chapi.cloudhealthtech.com/api/AzureVm?
      &api_key=<your_api_key>"
    ```

    #### List available fields for AWS Load Balancer
    ```
    curl "https://chapi.cloudhealthtech.com/api/AwsLoadBalancer?
      &api_key=<your_api_key>"
    ```

    #### Filter AWS Load Balancers by name
    ```
    curl "https://chapi.cloudhealthtech.com/api/search?
      &api_key=<your_api_key>
      &name=AwsLoadBalancer
      &query=name='a45075XXXXXXYYYYYYZZZZZ96f99'"
    ```

    #### Filter RDS Instances by instance ID and only display the instance IDs in the response
    ```
    curl "https://chapi.cloudhealthtech.com/api/search?
      &api_key=<your_api_key>
      &name=AwsRdsInstance
      &api_version=2
      &fields=instance_id
      &instance_id=<instance_id>"
    ```

    #### List active AWS Volumes and only display their Perspective Groups and Accounts in the response
    ```
    curl https://chapi.cloudhealthtech.com/api/search?
      &api_key=<your_api_key>
      &api_version=2
      &page=1
      &per_page=5
      &query=is_active=1
      &name=AwsVolume
      &fields=in_use,attr_group__33XXSSDDYYYY,account.name
    ```

    #### Include only instance as related object when searching for AWS Volumes
    ```
    curl 'https://chapi.cloudhealthtech.com/api/search?
      &api_key=<your_api_key>
      &api_version=2
      &page=1
      &per_page=5
      &name=AwsVolume
      &include=instance
    ```
---
