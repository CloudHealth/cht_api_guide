---
title: Delete AWS Account Assignment
position: 7
description: Delete the relationship between an AWS account and the Partner Customer to which it was assigned.
type: delete
endpoint: https://chapi.cloudhealthtech.com/v1/aws_account_assignments/:id
parameters:
  - name: id
    required: yes
    content: The ID of the AWS account assignment
right_code_blocks:
  - code_block: |-
      curl --request DELETE -H 'Content-Type: application/json'
        'https://chapi.cloudhealthtech.com/v1/aws_account_assignments/<id>?api_key=<your_api_key>'
    title: Sample Request
    language: bash
---
