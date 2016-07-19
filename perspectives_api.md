#Using the CloudHealth Perspective API
###Version 0.1 (2016-07-18)


##Overview
The CloudHealth Perspectives API allows for all CRUD operations on CloudHealth perspectives.  A user can complete these CRUD operations via a perspective schema json object. This schema can be retrieved by a READ operation for existing perspectives. 

Users can edit a schema file and upload it to an existing perspective to modify rules, merges, perform re-ordering (among other things). Users can also post a schema to create a brand new perspective, or delete a perspective with these API calls.

##Schema fields
A perspective schema has the following fields:

| **Schema Field**         | **Explanation**                                                                                                                                                                                                                                                                                                                |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ```name```               | The name of the perspective. This does not have to match the name of any pre-existing (active or archived) perspective.                                                                                                                                                                                                                       |
| ```include_in_reports``` | Whether the perspective is included in interactive reports.                                                                                                                                                                                                                                                                    |
| ```rules```              | An array of rules (objects) that govern perspective membership. The ordering of the rules matter; rules will be evaluated in order starting from the top. This part of the schema makes group reordering easy. Run a read operation to get the schema of a perspective, change the order in the schema via your favorite editor and upload the modified schema to same perspective. |
| ```merges```             | List of merge objects, which can be of type Dynamic Group or Dynamic Group Block. The Dynamic Group merge allows for two groups to merged and the Dynamic Block Group is to merge two entire blocks of group(s). Each merge specifies a list of source objects and a single target object (groups or blocks), where the sources are to be merged into the target.                                                                                             |
| ```constants```          | List of reference objects that refer to groups, blocks, and assets that are specified in rules. When a schema is retrieved through a read, every group (dynamic and static) is listed in the constants section. Although meant mainly for reference, constants can be modified to change the name of groups and blocks.   |

##Status Codes
Upon a successful call the API will return responses with corresponding http status:

| **Status Code** | **Meaning**           | **Comments**                                                                                                                                                                                             |
|-----------------|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 200             | OK                    | The request has succeeded.                                                                                                                                                                               |
| 400             | Bad Request           | This response means that server could not understand the request due to invalid syntax. The API will provide explanatory messages for bad requests _e.g. A perspective schema requires a name declaration_ |
| 500             | Internal Server Error | The server has encountered a situation it doesn't know how to handle.                                                                                                                                    |


##OPERATIONS

Through all these operation described below you should be able to fully manage your perspectives via the API. For all examples provided below, please note to replace:

  - <api_key> with your API Key
  - <perspective_id> with the required perspective id

##Read Operation
A curl invocation of the Read API call requires the id of the perspective and the api key. 
[See here on how to obtain an API key](https://docs.google.com/document/d/1eCNQwawgJVoYqCXoTgD95j_cvoqGNHMkchZDrcQHg54/edit#heading=h.1r6ts8di8kml).

###GET Action
```
GET "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective id>?api_key=<api key>"
```

####CURL Command

```bash
curl -s -H "Accept: application/json" "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective id>?api_key=<api key>"
```
**Or if you have python installed, print response in Pretty format**

```bash
curl -s -H "Accept: application/json" "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective id>?api_key=<api key>" | python -m json.tool
```

#### Sample Response

```
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
```



#### Sample Response - with Dynamic Group Block
```
{
    "constants": [
        {
            "list": [
                {
                    "name": "Env",
                    "ref_id": "206159110488"
                }
            ],
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
                }
            ],
            "type": "Dynamic Group"
        },
        {
            "list": [
                {
                    "is_other": "true",
                    "name": "Other",
                    "ref_id": "206195653674"
                }
            ],
            "type": "Group"
        }
    ],
    "include_in_reports": "true",
    "merges": [],
    "name": "Environment ",
    "rules": [
        {
            "asset": "AwsAsset",
            "name": "Env",
            "ref_id": "206159110488",
            "tag_field": [
                "cht_env"
            ],
            "type": "categorize"
        }
    ]
}
```

##Create Operation
To build a perspective from scratch directly using the API use the POST action with the perspective schema

###CURL - POST command

```bash
curl -s -H "Accept: application/json" -XPOST "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective id>?api_key=<api key>" -d 'schema=<schema in json format>'
```

####Create Perspective - CURL POST Command Example

```bash
curl -H "Accept: application/json" -XPUT "https://chapi.cloudhealthtech.com/v1/perspective_schemas?api_key=<api_key>" -d 'schema={"name":"Environment-new","rules":[{"type":"categorize","asset":"AwsAsset","tag_field":["cht_env"],"ref_id":"206159110488","name":"Env"}],"merges":[],"constants":[{"ref_type":"Dynamic Group Block","ref_id":"206159110488","name":"Env"},{"ref_type":"Dynamic Group","ref_id":"206199274950","blk_id":"206159110488","val":"production","name":"production"},{"ref_type":"Dynamic Group","ref_id":"206199274960","blk_id":"206159110488","val":"feature","name":"feature"},{"ref_type":"Group","ref_id":"206195653674","name":"Other","is_other":"true"}]}'
```

It is completely legal to extract a schema from a perspective (e.g. perspective A) and POST that schema after the name is changed (for example to B) to create a clone of A. All references in the schema rules to existing groups and blocks in A will just be seen as directive to create corresponding groups in B; it will not modify anything inside A. 

Another way to put this is, if there is a reference to a nonexistent group (nonexistent inside the target perspective) in a rule, the create/upload calls will create a brand new group inside the perspective for it. This way, if you specify multiple rules referring to the same target string "my new group" inside the schema, the create/upload operations will create a new group and ensure these rules point to the newly created group. 

For example, this following POST call will create a new perspective:

```bash
curl -H "Accept: application/json" -XPOST "https://chapi.cloudhealthtech.com/v1/perspective_schemas?api_key=<api_key>" -d 'schema={"name":"Test 1000002","rules":[{"type":"filter","asset":"AwsInstance","to":"new group 1","condition":{"clauses":[{"field":["Active?"],"op":"=","val":"true"}]}},{"type":"filter","asset":"AwsInstance","to":"new group 1","condition":{"clauses":[{"field":["First Discovered"],"op":">","val":"2016-01-04T23:19:34+00:00"}]}}],"constants":[],"merges":[]}'
{"message":"Perspective 893353516727 created"}
```

And when we do a Read call to fetch the schema for it after the Create, we'll see that;
a new group (Group-1) has been created and is displayed in the constants lists
the references to "new group 1" will have been converted into references to the corresponding newly created group.

```bash
curl -H "Accept: application/json" -XPOST "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective_id>?api_key=<api_key>"{"name":"Test 1000004","include_in_reports":"false","rules":[{"type":"filter","asset":"AwsInstance","to":"893374827932","condition":{"clauses":[{"field":["Active?"],"op":"=","val":"true"}]}},{"type":"filter","asset":"AwsInstance","to":"893374827932","condition":{"clauses":[{"field":["First Discovered"],"op":"\u003E","val":"2016-01-04T23:19:34+00:00"}]}}],"merges":[],"constants":[{"ref_type":"Group","ref_id":"893374827931","name":"Other","is_other":"true"},{"ref_type":"Group","ref_id":"893374827932","name":"Group-1"}]}
```

###Update

```bash
curl -s -H "Accept: application/json" -XPUT "https://chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective id>?api_key=<api key>" -d 'schema=<schema in json format>'
```

Update is similar to Create; in fact, Create essentially creates an empty perspective and 'updates' that perspective with the supplied schema. The actual Update call modifies the target perspective to have rules as specified in the uploaded schema. 

Note that:
This creates new groups when rules in the schema refer to groups that do not exist in the perspective.
Any existing group that is not referred to by a rule inside the schema will be deleted, if the allow_group_delete option is set. By default this is unset, and the call will fail if all rules to an existing group deletion is required.

In addition to "to" fields in rules that specify target groups, you can specify a "from" group as well (typically not needed as a missing "from" field is interpreted as begin "from" the  Other (Assets Not Allocated) group.

When you create a group-to-group rule, the update/create calls verified that the source group already has at least one rule higher in the rule that targets it.


###Destroy
```bash
curl -s -H "Accept: application/json" -XDELETE "chapi.cloudhealthtech.com/v1/perspective_schemas/<perspective id>?api_key=<api key>"
```
This call soft deletes a perspective if there are no dependences (such as from polices of subscriptions). To delete anyway, you can add a force option:

```bash
curl -s -H "Accept: application/json" -XDELETE "localhost:3000/v1/perspective_schemas/<perspective id>?api_key=<api key>&force=true"
```

Deletion, by default, is a soft delete. Deleted perspective gets put into the Archive and can be resurrected (but any dependencies will have been dropped, they would have to be recreated). If we want to skip the archive and perform a hard-delete, there is the hard_delete option:

```bash
curl -s -H "Accept: application/json" -XDELETE "localhost:3000/v1/perspective_schemas/<perspective id>?api_key=<api key>&force=true&hard_delete=true"
```

