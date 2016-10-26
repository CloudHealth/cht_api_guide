CloudHealth Partner AWS Account Assignment API
==============================================

The Partner AWS Account Assignment API is used to administer the
assignment of CloudHealth partners’ AWS accounts to their customers for
partner billing purposes.

# AWS account assignments

## Required fields

* `owner_id`: The AWS ID of the assigned account

* `customer_id`: The ID of the [customer](./partner_customer_api.md) to
  whom the account is assigned

* `payer_account_owner_id`: The AWS ID of the account whose bills should
  receive the billing line items for the assigned account

## CloudHealth-computed read-only fields

These are fields that CloudHealth generates and maintains.

* `id`: The ID of the account assignment

## Validation criteria

Each request to create or update an AWS account assignment must satisfy
the following criteria:

* All required fields are present when creating an AWS account
  assignment.

* The `owner_id` matches the `owner_id` of an
  [AWS account](./account_api.md) in the partner’s CloudHealth account.

    * This `owner_id` does not belong to any other AWS account
      assignment for the partner.

    * In AWS, the partner’s corresponding AWS account belongs to another
      account’s consolidated billing family.

* The `customer_id` matches the `id` of a
  [customer](./partner_customer_api.md) that belongs to the partner.

    * This customer has partner billing enabled by setting `enabled` to
      `true` in its `partner_billing_configuration`.

* For each customer identified by `customer_id`, all AWS account
  assignments follow one of these patterns:

    * All of the customer’s AWS accounts are standalone—each
      corresponding assignment’s `payer_account_owner_id` matches its
      `owner_id`.

    * One (and only one) of the customer’s AWS accounts is assigned as a
      consolidated account—its assignment’s `payer_account_owner_id`
      matches its `owner_id`.  All others are assigned as being linked
      to it—each corresponding assignment’s `payer_account_owner_id`
      matches the consolidated account’s `owner_id`.

* If this is a linked account assignment—the `payer_account_owner_id`
  does not match the `owner_id`—then the `payer_account_owner_id`
  matches the `owner_id` of a prior AWS account assignment for the same
  `customer_id`.  These additional criteria apply:

    * The prior AWS account assignment for the payer account—the one
      whose `owner_id` matches this assignment’s
      `payer_account_owner_id`—satisfies the following criteria:

        * The `owner_id` matches the `payer_account_owner_id`.

    * In AWS, both accounts belong to the same consolidated billing
      account family—the partner has a single account whose consolidated
      billing configuration contains both customer accounts as linked
      accounts.

## Media types

* Requests must send JSON content and specify the header
  `Content-Type: application/json`.

* Requests must accept JSON response content and specify an appropriate
  header such as `Accept: application/json` or `Accept: */*`.

When using cURL, the option `-H 'Content-Type: application/json'` is
necessary and sufficient to configure the request’s media type headers.

## Example: Create an AWS account assignment

### Request

```
{
    "owner_id": "000000000001",
    "customer_id": 1,
    "payer_account_owner_id": "000000000001"
}
```

### Response

```
{
    "customer_id": 1,
    "id": 1,
    "owner_id": "000000000001",
    "payer_account_owner_id": "000000000001"
}
```

### Example cURL request

```
curl --request POST -H 'Content-Type: application/json' -d '{"owner_id": "000000000001", "customer_id": 1, "payer_account_owner_id": "000000000001"}' 'https://chapi.cloudhealthtech.com/v1/aws_account_assignments?api_key=<api_key>'
```

## Example: Update an AWS account assigment

### Request

```
{
    "payer_account_owner_id": "000000000002"
}
```

### Response

```
{
    "customer_id": 1,
    "id": 1,
    "owner_id": "000000000001",
    "payer_account_owner_id": "000000000002"
}
```

### Example cURL request

```
curl --request PUT -H 'Content-Type: application/json' -d '{"payer_account_owner_id": "000000000001"}' 'https://chapi.cloudhealthtech.com/v1/aws_accounts/<id>?api_key=<api_key>'
```

## Endpoints

### Create an AWS account assignment

```
POST https://chapi.cloudhealthtech.com/v1/aws_account_assignments
```

* The request content is a JSON object that contains the required
  fields.

* If the corresponding AWS account does not exist in the customer’s
  CloudHealth account, it is created.

* If the operation is successful:

    * The response status is `200 OK`.

    * The response contains this header:

        * `Location`: The location of the created AWS account assignment

    * The response content is a JSON object that contains these fields:

        * All of the fields in the request

        * `id`: The ID of the created account assignment

* If the request content is invalid:

    * The response status is `422 Unprocessable Entity`.

    * The response content is an object with one field, `errors`, whose
      value is an array of validation error messages.

### Read an AWS account assignment

```
GET https://chapi.cloudhealthtech.com/v1/aws_account_assignments/<id>
```

* The response content is a JSON object with the following fields:

    * `id`: The ID of the AWS account assignment

    * `owner_id`: The AWS ID of the assigned account

    * `customer_id`: The ID of the [customer](./partner_customer_api.md)
      to whom the account is assigned

    * `payer_account_owner_id`: The AWS ID of the account whose bills
      receive the billing line items for the assigned account

### Read all AWS account assignments

```
GET https://chapi.cloudhealthtech.com/v1/aws_account_assignments
```

* The response contains these headers:

    * `X-Total`: The total number of AWS account assignments

    * `X-Per-Page`: The number of AWS account assignments that is
      returned per page

    * `Link`: A list of pages if the response content is truncated due
      to paging

* The response content is paged if the total number of AWS account
  assignments is greater than the number that is returned per page.

* The response content is a JSON object with one field,
  `aws_account_assignments`, whose value is an array of objects with the
  following fields:

    * `id`: The ID of an AWS account assignment

    * `owner_id`: The AWS ID of the assigned account

    * `customer_id`: The ID of the [customer](./partner_customer_api.md)
      to whom the account is assigned

    * `payer_account_owner_id`: The AWS ID of the account whose bills
      receive the billing line items for the assigned account

### Update an AWS account assignment

```
PUT https://chapi.cloudhealthtech.com/v1/aws_account_assignments/<id>
```

* The request content is a JSON object that contains a subset of the
  required fields.

* If the operation is successful:

    * The response status is `200 OK`.

    * The response contains this header:

        * `Location`: The location of the created AWS account assignment

    * The response content is a JSON object that contains these fields:

        * All of the fields in the request

        * `id`: The ID of the created account assignment

* If the request content is invalid:

    * The response status is `422 Unprocessable Entity`.

    * The response content is an object with one field, `errors`, whose
      value is an array of validation error messages.

### Delete an AWS account assignment

```
DELETE https://chapi.cloudhealthtech.com/v1/aws_account_assignments/<id>
```

* The AWS account assignment is deleted, but the corresponding AWS
  account in the customer’s CloudHealth account is unchanged.

  In other words, the customer’s AWS account will no longer receive
  partner-generated bills, but it will continue to be present in
  CloudHealth, together with all of its historical data and any
  subsequent data retrieved via the AWS API and any configured
  third-party integrations.

* If the operation is successful:

    * The response status is `204 No Content`.
