# CloudHealth Custom Tags API -- BETA

The CloudHealth Custom Tags API allows you to add tags (key-value pairs) to objects in the CloudHealth Platform, 
including taggable AWS assets, AWS accounts, taggable Azure assets and DataCenter Servers. 
These tags are completely independent of your cloud provider tags.

**Please Note:** When you tag objects using the CloudHealth API the resources are only tagged in the 
CloudHealth Platform and do not cascade down to your cloud provider (AWS, Azure, etc). However, we will continue 
to pull your tags from the cloud provider.   

### Endpoint:

**POST: `https://chapi.cloudhealthtech.com/v1/custom_tags?api_key=<YOUR API KEY>`**


where you replace `<YOUR API KEY>` with your API Key from the `My Profile` section of [CloudHealth Technologies Application](https://apps.cloudhealthtech.com)

### Headers:
<pre><code>Accept: application/json
Content-Type: application/json
</code></pre>

### Request Body Example:
<pre><code>
{
    "tag_groups": [
        {
            "asset_type": "AwsAccount",
            "ids": [12345, 56789],
            "tags": [{"key": "owner", "value": "Fred"}]
        },
        {
            "asset_type": "AwsInstance",
            "ids": [1511831925873],
            "tags": [{"key": "environment", "value": "Test"}, {"key": "owner", "value": "Mary"}]
        },
        {
            "asset_type": "AwsRdsInstance",
            "ids": [206158446754],
            "tags": [{"key": "environment", "value": "Production"}, {"key": "owner", "value": "Mary"}]
        }
    ]
}
</code></pre>

Where:

* `asset_type` is one of the supported taggable objects (see list above)
* `ids` is a list of CloudHealth IDs
* `tags` is a list of key value tag pairs


## Constraints:  

* No more than 100 instances per request
* No more than 100 tags per instance
* Tag keys must be between 1 and 127 characters long
* Tag values must be no longer than 255 characters long
* Tag values must be scalar.  Lists and objects are not allowed. Numbers will be converted to strings.
* Tag value will be stripped of leading and trailing whitespace

## Processing:  

* The entire payload will be processed.  Any failures will be noted, and processing will continue.
* If the tag
  * does not exist, it will be created.
  * exists, is **customer set**, and the new value is **not null**, it will be replaced
  * exists, is **customer set**, and the new value is **null**, it will be removed
  * exists, and it came from a **cloud provider** (e.g. AWS), and the new value is **not null**, it will be replaced (and the original value saved off)
  * exists, and it came from a **cloud provider** (e.g. AWS), and the new value is **null**, the original value, if any, will be restored

## Response:
<pre><code>
{
       "updates": [
           {
               "asset_type": "AwsAccount",
               "asset_id": 12345,
               "tag_key": "owner",
               "tag_value": "Fred"
           },
           {
               "asset_type": "AwsAccount",
               "asset_id": 56789,
               "tag_key": "owner",
               "tag_value": "Fred"
           },
           {
               ...
           }
       ],
       "errors": [
           {
               "message": "Asset does not exist or user does not have access",
               "asset_type": "AwsRdsInstance",
               "asset_id": 206158446754
           }
       ]
}

</code></pre>

* The response body is JSON
* Each successful update will be returned as an entry in the "updates" array
* Each partial failure will be returned with an indicator as to which object/tag failed along with a descriptive message if possible
* If there is a mix of updates and errors, the HTTP response code will still be 200 OK 


### CURL example:
<pre><code>curl -H "Accept: application/json" -H "Content-Type: application/json" -XPOST "https://chapi.cloudhealthtech.com/v1/custom_tags?api_key=99999999-9999-9999-9999-999999999999" -d '{"tag_groups":[{"asset_type": "AwsAccount","ids": [90],"tags": [{"key": "testtag1", "value": null}]}]}'</code></pre>
