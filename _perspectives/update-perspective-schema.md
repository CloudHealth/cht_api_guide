---
title: Update Perspective Schema
position: 7
description: Modify a Perspective based on rules posted through a schema.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/perspective_schemas/:perspective-id
parameters:
  - name: check_version
    required: no
    content: Number that specifies the version of the Perspective schema that should be updated.
  - name: include_version
    required: no
    content: Boolean that defines whether the current version of the perspective is returned in the response.
  - name: org_id
    required: no
    content: String that specifies the ID of the organization in which this query should run. See [How to Get Organization ID](#organization_how-to-get-organization-id). If not specified, this parameter assumes the ID of your default organization.
content_markdown: |-
  If the schema contains references to Groups that do no exist in the Perspective, the PUT operation creates those Groups in the Perspective.
  {:.warning}

  You can specify both `to` and `from` fields in rules that reference target Groups. The `from` field is optional. When it is not present, the `Other (Assets Not Allocated)` group is considered to be the `from` Group.

  When you create a group-to-group rule, the update/create calls verify that the source group already has at least one rule higher in the rule that targets it.

  #### How to Avoid Conflicts during Concurrent Updates
  Use the `check_version` parameter to ensure that a concurrent update is not overwritten.
  ```
  curl -s -H 'Content-Type: application/json' -X PUT "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>?api_key=<api_key>&check_version=3"
  ```
  If the Perspective was updated, and therefore version-incremented, since the last GET operation, the update request returns a `400` error.

  #### How to Remove a Static Group from a Perspective
  To remove a static group from a perspective, remove the rules targeting that group from the schema.

  In this example, the static group `Group To Delete` will be removed from the perspective, and `Group to Keep` will not be removed. The following example shows what the schema looks like before the group is removed from the perspective:

  ```
  {
   "name": "RemoveStaticGroup",
   "rules": [
     {
       "type": "filter",
       "asset": "Group To Keep",
       "to": "123456789",
       "condition": {
         "clauses": [
           {
             "field": [
               "Active?"
             ],
             "op": "=",
             "val": "true"
           }
         ]
       }
     },
     {
       "type": "filter",
       "asset": "Group To Delete",
       "to": "2468101214",
       "condition": {
         "clauses": [
           {
             "field": [
               "Active?"
             ],
             "op": "=",
             "val": "false"
           }
         ]
       }
     }
   ],
   "merges": [

   ],
   "constants": [
     {
       "type": "Static Group",
       "list": [
         {
           "ref_id": "123456789",
           "name": "KeepMe"
         },
         {
           "ref_id": "2468101214",
           "name": "DeleteMe"
         },
         {
           "ref_id": "13579131517",
           "name": "Other",
           "is_other": "true"
         }
       ]
     }
   ],
   "include_in_reports": "false"
  }
  ```

  After the group is removed, the schema no longer lists the `Group to Delete`:

  ```
  {
   "name": "AfterRemovingStaticGroup",
   "rules": [
     {
       "type": "filter",
       "asset": "Group To Keep",
       "to": "123456789",
       "condition": {
         "clauses": [
           {
             "field": [
               "Active?"
             ],
             "op": "=",
             "val": "true"
           }
         ]
       }
     },
   "merges": [

   ],
   "constants": [
     {
       "type": "Static Group",
       "list": [
         {
           "ref_id": "123456789",
           "name": "KeepMe"
         },
         {
           "ref_id": "13579131517",
           "name": "Other",
           "is_other": "true"
         }
       ]
     }
   ],
   "include_in_reports": "false"
  }
  ```
right_code_blocks:
  - code_block: |-
      curl -s -H 'Content-Type: application/json' -X PUT "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>
        ?api_key=<api_key>" -d '{"schema":<schema JSON>}'
    title: Update
    language: bash
---
