---
title: Get External ID
position: 6
description: Generate your unique customer External ID so that you can configure an IAM Role in the AWS Console.
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/aws_accounts/:id/generate_external_id
content_markdown: |-
  You cannot generate and specify your own External ID as the value of the `assume_role_external_id` parameter.

  CloudHealth generates a unique External ID for each customer. You can only use this ID as the value of the `assume_role_external_id` parameter.
  Because the CloudHealth-generated ID is unique to you, you can reuse it across all your accounts.

  To get your External ID, log into the [CloudHealth Platform](https://apps.cloudhealthtech.com). From the left menu, select **Setup > Accounts > AWS** and click **New Account**. The account setup form displays the generated External ID.

  ![](images/get-external-id.png)

  You can also get your API key through an endpoint.
right_code_blocks:
  - code_block: |-
      curl --request GET -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' "https://chapi.cloudhealthtech.com/v1/aws_accounts/:id/generate_external_id"
    title: Sample Request
    language: bash
---
