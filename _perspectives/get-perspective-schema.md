---
title: Retrieve Perspective Schema
position: 5
description: Retrieve the schema that defines a specific Perspective. Identify the specific Perspective by its ID. See [How to Get Perspective ID](#perspectivesget-perspective-id).
type: get
endpoint: https://chapi.cloudhealthtech.com/v1/perspective_schemas/:perspective-id
parameters:
  - name: include_version
    required: no
    content: Boolean that defines whether the current version of the perspective is returned in the response.
left_code_blocks:
  - code_block: |-
      {
        "schema": {
          "constants": [{
            "list": [{
              "name": "Env",
              "ref_id": "206159110488"
            }],
            "type": "Dynamic Group Block"
          },
          {
            "list": [
            {
              "blk_id": "206159110488",
              "name": "production",
              "ref_id": "206199274950",
              "val": "production"
            },
            {
              "blk_id": "206159110488",
              "name": "feature",
              "ref_id": "206199274960",
              "val": "feature"
            }],
            "type": "Dynamic Group"
          },
          {
            "list": [{
              "is_other": "true",
              "name": "Other",
              "ref_id": "206195653674"
            }],
            "type": "Group"
          }],
          "include_in_reports": "true",
          "merges": [],
          "name": "Environment ",
          "rules": [{
            "asset": "AwsAsset",
            "name": "Env",
            "ref_id": "206159110488",
            "tag_field": [
                "cht_env"
            ],
            "type": "categorize"
          }]
        }
      }
    title: Response with Dynamic Groups
    language: json
right_code_blocks:
  - code_block: |-
      curl -s -H "Accept: application/json"
        "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>
        ?api_key=<api_key>"
    title: Request
    language: bash
  - code_block: |-
      {
        "schema":
        {
          "constants": [
            {
              "list": [
                {
                  "is_other": "true",
                  "name": "Other",
                  "ref_id": "206213093633"
                }
              ],
              "type": "Group"
            }
          ],
          "include_in_reports": "true",
          "merges": [],
          "name": "API",
          "rules": []
        }
      }
    title: Response
    language: bash
  - code_block: |-
      curl -s -H "Accept: application/json"
        "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>
        ?api_key=<api_key>" | python -m json.tool
    title: Pretty print results
    language: bash
---
