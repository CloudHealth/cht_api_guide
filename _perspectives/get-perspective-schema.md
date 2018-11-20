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
right_code_blocks:
  - code_block: |-
      curl -s -H "Accept: application/json" "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>?api_key=<api_key>"
    title: Request
    language: bash
  - code_block: |-
      {
        "schema": {
          "name": "Environment",
          "include_in_reports": "true",
          "rules": [
            {
              "type": "categorize",
              "asset": "AwsAsset",
              "tag_field": [
                "cht_env"
              ],
              "ref_id": "5841XXXXXXX853",
              "name": "AWS Assets"
            },
            {...}
          ],
          "merges": [
            {
              "type": "Group",
              "to": "584XXXXX39263",
              "from": [
                "584YYYYYY9283"
              ]
            },
            {...}
          ],
          "constants": [
            {
              "type": "Dynamic Group Block",
              "list": [
                {
                  "ref_id": "ABCDEFG522853",
                  "name": "AWS Assets"
                },
                {...}
              ]
            },
            {...}
          ]
        }
      }
    title: Response
    language: bash
  - code_block: |-
      curl -s -H "Accept: application/json" "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>?api_key=<api_key>" | python -m json.tool
    title: Pretty print results
    language: bash
---
