---
title: Add Dynamic Group to Perspective
type: example
description: Add a dynamic group to an existing Perspective. You can exclude the `ref_id` field from the request. Alternately, if you include the `ref_id` field, specify an arbitrary numerical value for it.
position: 9
right_code_blocks:
  - code_block: |-
      curl -s -H 'Authorization: Bearer <your_api_key>' -H 'Accept: application/json'
        "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id> -d '{"type": "categorize","asset": "AwsAsset","tag_field": ["Environment"],"ref_id": "123456789","name": "Environment"}'
    title: Request
    language: bash
---
