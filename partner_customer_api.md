Customer Provisioning for Partners
=

## Customer API

This API enables partners to create, modify, delete, and retrieve Customers in CloudhHealth.

### Creating a new Customer

You can create a new Customer with this call

```shell
curl --request POST -H 'Content-Type: application/json'  -d '{“name”: “Acme Corp”, "billing_contact":"john.doe@acmecorp.com", "trial_expiration_date":"2016-09-22T00:00:00", "partner_billing_configuration":{"enabled":"true","folder":""}, "address":{"street1":"1 Main St","city":"Springfield","state":"MA","zipcode":"01234","country":"US"}}' "https://chapi.cloudhealthtech.com/v1/customers?api_key=<API_KEY>"
```
A new active, blank Customer will be created. Accounts from the partner consolidated can now be assigned to this customer.

The following attributes are supported for customers.
 
#### Required Fields
 
 `name` : A unique name for the Customer
 
 `location` : Composite of `address1`, `address2`, `city`, `state`, `zip_code`, `country`
 
#### Optional Fields
 
 `trial_expiration_date` : A date in future when the customer's trial expires. Users in customer will no longer be able to access CloudHealth.
 
 `billing_contact` : A text field to store an email address for a contact.
 
 `partner_billing_configuration`: Composite of boolean `enabled` (whether partner billing is enabled) and `folder` (folder prefix in S3 bucket for uploading billing artifacts.
 
 #### Read-only Fields
 
`id` : Reference id for the customer

`created_at`: When the customer was originally created

`updated_at`: When the customer attributes were last modified
 
## Modifying existing customers

An example call for modifying customer with `id` 3942 :

````shell
curl --request PUT -H 'Content-Type: application/json' -d '{“name”: “Acme Corporation”}’  "https://chapi.cloudhealthtech.com/v1/customers/3942?api_key=<API_KEY>"
````

You can specify any modifiable attribute.

## Deleting Customers

Customers can be deleted with the following call.

```shell
curl -X "DELETE" https://chapi.cloudhealthtech.com/v1/customers/3942?api_key=<API_KEY>
```

## Retrieving List of Customers

```shell
curl -H "Content-Type: application/json" 'https://chapi.cloudhealthtech.com/v1/customers?api_key=<API_KEY>"
```
