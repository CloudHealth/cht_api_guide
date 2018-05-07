---
title: List of Queryable Assets
type: get
description: Retrieve the API names of all AWS, Azure, Data Center, and Google Cloud asset objects that you can query in the CloudHealth Platform.
position: 2
endpoint: https://chapi.cloudhealthtech.com/api
parameters:
  - name:
    content:
content_markdown: |-
  The response to this query contains a list of JSON objects that represent all the AWS, Azure, Data Center, and Google Cloud assets that CloudHealth has discovered in your environment.
right_code_blocks:
  - code_block: |
      curl 'https://chapi.cloudhealthtech.com/api?
        api_key=<<your_API_key>'
    title: Request
    language: bash
  - code_block: |-
      [  
        "AwsInstanceType",
        ...
        "AwsCloudtrailTrail",
        "AwsConfigRuleEvaluationResult",
        "AwsConfigRule",
        "AwsIamRole",
        "AwsIamServerCertificate",
        ...
        "IntegrationNode",
        "IntegrationTag",
        "JiraAccount",
        "NewrelicAccount",
        "GcpComputeInstance",
        ...
        "AzureResourceGroup",
        "AzureSearchService",
        "AzureSqlDatabase",
        "AzureSqlServer",
        "AzureStorSimpleDeviceManager",
        ...
        "AlertlogicAccount",
        "DataCenterServerCpu",
        "DataCenterTag",
        "VmwareHost",
        "VmwareVirtualMachine",
        ...
        "AwsInstanceReservationListing",
        "AwsInstanceReservationModificationItem",
        "AwsInstanceReservationModification",
        "AwsInstanceReservation",
        ...
      ]
    title: Response
    language: json
---
