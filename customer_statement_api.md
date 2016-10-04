Overview for Customer Statement API
=

## Customer Statement API

This API enables customers to read their customer statements

## Retrieving a single customer statement

```shell
curl -H "Content-Type: application/json" 'https://chapi.cloudhealthtech.com/v1/customer_statements/:id?api_key=<API_KEY>"
```

Sample Response:

```
{
      customer_id : 1211,
      billing_period : "2016-08",
      total_amount : 211,523.09,
      status : "estimated",
      detailed_billing_records_generation_time : "2016-08-23 23:59:11",
      statement_generation_time : "2016-08-23 23:59:41",
      statement_summary_generation_time : "2016-08-23 23:59:53",
      currency: {
        name: "USD",
        symbol: "$"
      }
}
```


## retrieving list of customer statements

```shell
curl -H "Content-Type: application/json" 'https://chapi.cloudhealthtech.com/v1/customer_statements?api_key=<API_KEY>"
```
