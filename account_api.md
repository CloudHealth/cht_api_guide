CloudHealth Account API
=======================

The Account API is used to administer Cloud Provider and Third Party integration accounts.

# AWS Accounts

## Required Fields:

* `name`: Display Name - Must by unique within customer.

* Authentication
    * `protocol`: Either `access_key` or `assume_role`
    * `access_key`: Access Key, required if using authentication
    * `secret_key`: Secret Key, required if using authentication
    * `assume_role_arn`: Assume Role ARN, required if using Role-based authentication
    * `assume_role_external_id`: External ID, required if using Role-based authentication.
       CloudHealth generates a unique External ID for each customer. To get your External ID, log into the CloudHealth platform (https://apps.cloudhealthtech.com). From the left menu, select **Setup > Accounts > AWS** and click **New Account**. The account setup form displays the generated External ID.

       ![](/images/get-external-id.png)

## Optional Fields:

* Standard
    * `tags`: Key/Value identifiers. Keys must be unique.
    * `hide_public_fields`: If enabled, public DNS and IP info will not be stored
    * `region`: Either `global` or `govcloud`. Defaults to `global`

* Billing
    * `bucket`: S3 bucket containing the detailed billing record files

* CloudTrail
    * `enabled`: Whether to collect CloudTrail files. Off by default.
    * `bucket`: S3 bucket containing the files
    * `prefix`: Prefix of files if configured

* AWS Config
    * `enabled`: Whether to collect AWS Config files. Off by default.
    * `bucket`: S3 bucket containing the files
    * `prefix`: Prefix of files if configured

* CloudWatch
    * `enabled`: Whether to collect CloudWatch data. On by default.

## CloudHealth Computed Read-only Fields

These are fields that CloudHealth generates and maintains.

* `id`: CloudHealth Unique Identifier
* `created_at`: Date this account was created in CloudHealth
* `updated_at`: Date this account was last updated in CloudHealth
* Status `level`: `green`, `yellow`, `red`, `unknown` - Signals authentication issues with the account.
* Status `last_update`: Last time `level` was updated.
* `groups`: CloudHealth Perspective Membership

## Discovered Read-only Fields

These fields are discovered after creation by interacting with the AWS API or by parsing a billing statement.

* `amazon_name`: Display name from within Amazon
* `owner_id`: AWS Id. Discovered from authentication credentials. Must be unique.
* `account_type`: `Consolidated`, `Linked`, `Standalone`, `Unknown` - Discovered from analyzing the DBR
* `vpc_only`: If the account can only create assets in a VPC. Discovered if authentication credentials are provided
* `cluster_name`: The payer account's name.
* Billing `is_consolidated`: If this is a consolidated account.

## Example: Create Account

> **It is critical to pass in `-H 'Content-Type: application/json'` on the command line because curl defaults to `application/x-www-form-urlencoded` which won't work.**

Request:

```
{
    "name": "Production Account",
    "authentication": {
        "protocol": "access_key",
        "access_key": "AKIAQQQQQQQQQQQ",
        "secret_key": "S87345j34lkj3l45lkj3453453453+2342"
    },
    "billing": {
        "bucket": "my-billing-bucket"
    },
    "cloudtrail": {
        "enabled": true,
        "bucket": "my-cloudtrail-bucket"
    },
    "aws_config": {
        "enabled" :true,
        "bucket": "my-aws-config-bucket",
        "prefix": "foo"
    },
    "tags": [
        {"key": "Environment", "value": "Production"}
    ]
}
```

Response:

```
{
  "id": 1,
  "name": "Production Account",
  "hide_public_fields": false,
  "region": "global",
  "created_at": "2015-12-16T23:03:49Z",
  "updated_at": "2015-12-16T23:03:49Z",
  "account_type": "Unknown",
  "status": {
    "level": "unknown"
  },
  "authentication": {
    "protocol": "access_key",
    "access_key": "AKIAQQQQQQQQQQQ"
  },
  "billing": {
    "bucket": "my-billing-bucket",
    "is_consolidated": false
  },
  "cloudtrail": {
    "enabled": true,
    "bucket": "my-cloudtrail-bucket"
  },
  "aws_config": {
    "enabled": true,
    "bucket": my-aws-config-bucket,
    "prefix": "foo"
  },
  "cloudwatch": {
    "enabled": true
  },
  "tags": [
    {
      "key": "Environment",
      "value": "production"
    }
  ],
  "_links": {
    "self": {
      "href": "/v1/aws_accounts/1"
    }
  }
}
```
###Sample Request
```
curl -d '{"name": "Production Account","authentication": {"protocol": "access_key","access_key": "AKIAQQQQQQQQQQQ","secret_key": "S87345j34lkj3l45lkj3453453453+2342"},"billing": {"bucket": "my-billing-bucket"},"cloudtrail": {"enabled": true,"bucket": "my-cloudtrail-bucket"},"aws_config": {"enabled" :true,"bucket": "my-aws-config-bucket","prefix": "foo"},"tags": [{"key": "Environment", "value": "Production"}]}' -H 'Content-Type: application/json' --request POST 'https://chapi.cloudhealthtech.com/v1/aws_accounts?api_key=f<api_key>'
```

## Example: Update Account

Request:

```
{
  "name": "Production Engineering Account",
  "tags": [
    {
      "key": "Environment",
      "value": "production"
    },
    {
      "key": "Owner",
      "value": "Engineering"
    }
  ]
}
```

* Note: The tag collection will be completely replaced by the new set passed in. Thus, an empty array will clear tags.

###Sample Request
```
curl -d '{"authentication":{"protocol":"assume_role","assume_role_arn":"arn:123","assume_role_external_id":"61a1XXXXXXXXXXXXXXXXXXXXX5d8c6"},"name":"Tools 123"}' -H 'Content-Type: application/json' --request PUT 'https://chapi.cloudhealthtech.com/v1/aws_accounts/<account_id>?api_key=<api_key>'
```

## Endpoints

### Create

`POST https://chapi.cloudhealthtech.com/v1/aws_accounts`

* Result header will contain `Location: https://chapi.cloudhealthtech.com/v1/aws_accounts/1`

### Read Single Account

`GET https://chapi.cloudhealthtech.com/v1/aws_accounts/:id`

### Read Accounts

`GET https://chapi.cloudhealthtech.com/v1/aws_accounts`

* Results will be paged
    * Use the `page` query param to increment the page.
       * `GET https://chapi.cloudhealthtech.com/v1/aws_accounts?page=2`
    * The `per_page` param will adjust the number of results per page. It is 30 by default.
       * `GET https://chapi.cloudhealthtech.com/v1/aws_accounts?page=3&per_page=100`
* Header will contain:
    * `X-Total`: Total number of accounts
    * `X-Per-Page`: Accounts returned per page
    * `Link`: List of pages if results are truncated due to paging.

### Update Account

`PUT https://chapi.cloudhealthtech.com/v1/aws_accounts/:id`

### Delete Account

`DELETE https://chapi.cloudhealthtech.com/v1/aws_accounts/:id`
