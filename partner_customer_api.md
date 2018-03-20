Customer Provisioning for Partners
=

## Customer API

This API enables partners to create, modify, delete, and retrieve Customers in CloudhHealth.

### Creating a new Customer

You can create a new Customer with this call

Request:

```
{
    "name": "Acme Corp",
    "classification": "managed_without_access",
    "billing_contact": "john.doe@acmecorp.com",
    "trial_expiration_date": "2016-09-22T00:00:00Z",
    "partner_billing_configuration": {
        "enabled": "true",
        "folder": ""
    },
    "address": {
        "street1": "1 Main St",
        "city": "Springfield",
        "state": "MA",
        "zipcode": "01234",
        "country": "US"
    },
    "tags": [{
              "key": "customer_id", "value": "973532"
            },
            {
              "key": "service_package", "value": "basic_managed"
            }
    ]
}
```

Response:

```
{
    "id": 3947,
    "name": "Acme Corp",
    "classification": "managed_without_access",
    "billing_contact": "john.doe@acmecorp.com",
    "margin_percentage": 0.0,
    "created_at": "2016-09-15T18:17:04Z",
    "updated_at": "2016-09-15T18:17:04Z",
    "generated_external_id": "1a2b3c4d5e6f",
    "partner_billing_configuration": {
        "enabled": true,
        "folder": ""
    },
    "address": {
        "street1": "1 Main St",
        "city": "Springfield",
        "state": "MA",
        "zipcode": "01234",
        "country": "US"
    },
    "tags": [{
              "key": "customer_id", "value": "973532"
            },
            {
              "key": "service_package", "value": "basic_managed"
            }
    ],
    "_links": {
        "self": {
         "href": "/v1/customers/3947"
      }
   }
}
```

```shell
curl --request POST -H 'Content-Type: application/json' -d '{ "name": "Acme Corp", "classification": "managed_without_access", "billing_contact": "john.doe@acmecorp.com", "trial_expiration_date": "2016-09-22T00:00:00", "partner_billing_configuration": {"enabled": "true", "folder": "" }, "address": { "street1": "1 Main St", "city": "Springfield", "state": "MA", "zipcode": "01234", "country": "US" } }' "https://chapi.cloudhealthtech.com/v1/customers?api_key=<API_KEY>"
```
A new active, blank Customer will be created. Accounts from the partner consolidated can now be assigned to this customer.

The following attributes are supported for customers.

#### Required Fields

* `name`: A unique name for the Customer

* `address`: An object with the following **case-sensitive** fields:

  * `street1`

  * `street2`

  * `city`

  * `state` (can be code or the full state name)

  * `zipcode`

  * `country` (can be code or the full country name)

#### Optional Fields

* `classification`: The customer's classification.  One of the following values:

  * `"managed_without_access"`: A managed customer that does not directly access the CloudHealth platform.

  * `"managed_with_access"`: A managed customer that directly accesses the CloudHealth platform.

* `trial_expiration_date`: A date in future when the customer's trial expires. Users in customer will no longer be able to access CloudHealth. Dates format should always be iso8601

* `billing_contact` : A text field to store an email address for a contact.

* `partner_billing_configuration`: Composite of boolean `enabled` (whether partner billing is enabled) and `folder` (folder prefix in S3 bucket for uploading billing artifacts.

* `tags`: Key/Value identifiers. Maximum of 20 tags per customer can be created

#### Read-only Fields

* `id` : Reference id for the customer also known as MSP Client API Id

* `created_at`: When the customer was originally created

* `updated_at`: When the customer attributes were last modified

* `generated_external_id`: External ID required for accounts with IAM Role Authorization

* `billing_configuration_status`: configuration status (Healthy or not Healthy)

* `billing_configuration_reason`: configuration reason for non-healthy

## Modifying existing customers

An example call for modifying customer with `id` 3942 :

Request:

```
{
    "name": "Acme Corporation",
    "classification": "managed_with_access"
}
```

Response:

```
{
    "id": 3942,
    "name": "Acme Corporation",
    "classification": "managed_with_access",
    "billing_contact": "john.doe@acmecorp.com",
    "margin_percentage": 0.0,
    "created_at": "2016-09-15T13:10:47Z",
    "updated_at": "2016-09-15T16:46:34Z",
    "generated_external_id": "1a2b3c4d5e6f",
    "partner_billing_configuration": {
        "enabled": true,
        "folder": ""
    },
    "address": {
       "street1": "1 Main St",
       "street2": "",
       "city": "Springfield",
       "state": "MA",
       "zipcode": "01234",
       "country": "US"
    },
    "_links": {
        "self": {
            "href": "/v1/customers/3942"
        }
    }
}
```

````shell
curl --request PUT -H 'Content-Type: application/json' -d '{"name": "Acme Corporation", "classification": "managed_with_access"}'  "https://chapi.cloudhealthtech.com/v1/customers/3942?api_key=<API_KEY>"
````

You can specify any modifiable attribute.

## Deleting Customers

Customers can be deleted with the following call.

```shell
curl -X "DELETE" https://chapi.cloudhealthtech.com/v1/customers/3942?api_key=<API_KEY>
```


## Retrieving a single customer

```shell
curl -H "Content-Type: application/json" 'https://chapi.cloudhealthtech.com/v1/customers/:id?api_key=<API_KEY>"
```

## Retrieving List of Customers

```shell
curl -H "Content-Type: application/json" 'https://chapi.cloudhealthtech.com/v1/customers?api_key=<API_KEY>"
```
