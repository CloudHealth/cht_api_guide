---
title: Create Perspective Schema
position: 6
description: Create a Perspective and associate it with a new schema. The ID of the new Perspective is returned in the message field in the POST response.
type: post
endpoint: https://chapi.cloudhealthtech.com/v1/perspective_schemas/
parameters:
  - name: include_version
    required: no
    content: Boolean that defines whether the current version of the perspective is returned in the response.
  - name: org_id
    required: no
    content: String that specifies the ID of the organization in which this query should run. See [How to Get Organization ID](#organization_how-to-get-organization-id). If not specified, this parameter assumes the ID of your default organization.
content_markdown: |-
  #### How to Duplicate a Perspective
  To duplicate a Perspective, retrieve the schema from the source Perspective (e.g., Perspective A) and POST that schema with a new name (e.g., Perspective B) to create a duplicate of Perspective A. All references in the schema rules to existing groups and blocks in Perspective A are seen as directives to create corresponding groups in Perspective B. Perspective A and its Groups remain unchanged.

  #### How to Add a Perspective Group
  When creating a Perspective, if your schema contains a reference to a Group that does not exist within the Perspective, the POST call creates that Group in the Perspective. Therefore, if there are rules in your schema that reference a Group that does not exist in the Perspective, the POST call creates that new Group and associates those rules with the newly created Group.

  For example, this POST call creates a Perspective:
  ```
  curl -H 'Content-Type: application/json' -XPOST "https://chapi.cloudhealthtech.com/v1/perspective_schemas?api_key=<api_key>" -d '{"schema":{"name":"Test 1000002","rules":[{"type":"filter","asset":"AwsInstance","to":"new group 1","condition":{"clauses":[{"field":["Active?"],"op":"=","val":"true"}]}},{"type":"filter","asset":"AwsInstance","to":"new group 1","condition":{"clauses":[{"field":["First Discovered"],"op":">","val":"2016-01-04T23:19:34+00:00"}]}}],"constants":[],"merges":[]}'
  ```

  When you make a subsequent GET call to retrieve this schema, a new group (Group-1) is created and displayed in the response. All references to `new group 1` in the schema are converted into references to the newly created group.
right_code_blocks:
  - code_block: |-
      curl -s -H 'Content-Type: application/json' -XPOST "https://chapi.cloudhealthtech.com/v1/perspective_schemas/?api_key=<api_key>" -d '{"schema": {"name": "Environment","include_in_reports": "true",
      "rules": [{"type": "categorize","asset": "AwsAsset","tag_field": ["cht_env"],"ref_id": "5841XXXXXXX853","name": "AWS Assets"}],
      "merges": [{"type": "Group","to": "584XXXXX39263","from": ["584YYYYYY9283"]}],
      "constants": [{"type": "Dynamic Group Block","list": [{"ref_id": "ABCDEFG522853","name": "AWS Assets"}],
      }}'
    title: Post
    language: bash
---
