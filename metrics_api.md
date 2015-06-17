#CloudHealth Metrics API -- BETA

The CloudHealth Metrics API allows you to upload various system metrics to CloudHealth. By doing so, you will not only have a better view into the health and performance of your systems, but CloudHealth will be able to generate better rightsizing recommendations.

Sending us metrics is as simple as POSTing a JSON document to the /metrics/v1 endpoint. The JSON format is described below.

NOTE 1: Authentication via api-key is required as described in the main README document in this repo.

NOTE 2: This API has a dry run facility that will allow you to test your writes without actually persisting them to the database. To use it, just add `dryrun=true` as a query parameter to the URL.

NOTE 3: If your client library does not support sending parameters via both the query string and the POST body, you can supply the API key and the dryrun flag as root level elements in the POST body.

##Current Limitations
In this early release there are a few limitations on what we can accept.
- You may post CPU and memory metrics only
- Metrics must be at an hourly resolution
- An active AWS instance associated with the metrics must already present in the CloudHealth platform and not be Chef-managed
- Metric retrieval is for individual assets only.

In the near future, we will support metrics for a larger variety of assets, 15 minute resolutions, and metrics from other cloud providers and local datacenters.

##POST Data Format
To send system metrics to CloudHealth you need to provide us with a collection of `datasets`. Each dataset consists of a `metadata` header describing the data being sent and an array of `values` that actually is the data. Each dataset describes a single asset type: instance currently.

A collection of one or more datasets is bound up in a hash rooted with the *metrics* element. Note that, because only instances are currently supported, there is no need to send more than one dataset.

```
"metrics": {
  "datasets": []
}
```

Each dataset is a hash consisting of metadata and an array of values. Each element in the values array is itself an array of metrics for a given interval and instance:

```
{
  "metadata": {},
  "values": [
    [],
  ]
}
```

The metadata hash describes the data you are sending. It consists of an asset type, the granularity of the included data, and an array of keys that describes the 'type' of each element in the values array.

```
"metadata": {
  "assetType": 'aws:ec2:instance',
  "granularity": 'hour',
  "keys" [
    "assetId",
    "timestamp",
    "memory:free.avg",
    "memory:free.max",
    ...
  ]
}
```
The supported asset types are as follows:

- aws:ec2:instance

The supported granularities are as follows:

- hour

The following keys are supported:

- assetId
- timestamp
- cpu:usedPercent.avg
- cpu:usedPercent.max
- cpu:usedPercent.min
- memory:free.avg
- memory:free.min
- memory:free.max
- memory:used.avg
- memory:used.min
- memory:used.max
- memory:usedPercent.avg
- memory:usedPercent.min
- memory:usedPercent.max

The `values` array has an entry for each series of metrics you care to send us. Each entry is itself an array of metrics corresponding to the elements in the `keys` array -- in the same order and of the same length!

Each array of metrics species the instance (using a compact form of the AWS ARN format), a timestamp (in ISO-8601 format), and the supplied metrics (numbers -- integer or float). A single array of metrics can contain information about CPU and/or memory if the asset type is an instance). Each instance or granularity is a new array of values.

The compact ARN must be in the form <region>:<account-number>:<AWS-instance-ID>.  And the time stamp must be on an hourly boundary and be UTC-based.

```
"values": [
  [
    "us-east-1:12345678:i-a99a99a9", "2015-06-03T00:01:00+00:00", 200, 400, ...],
    "us-east-1:12345678:i-a99a99a9", "2015-06-03T00:02:00+00:00", 100, 300, ...],
  ]
]
```

Pulling this all together we have:

```
{
  "metrics": {
    "datasets": [
      {
        "metadata": {
          "assetType": "aws:ec2:instance",
          "granularity": "hour",
          "keys": [
            "assetId",
            "timestamp",
            "memory:free.avg",
            "memory:free.max",
            "memory:free.min"
            "memory:used.avg",
            "memory:used.max",
            "memory:used.min"
            "memory:usedPercent.avg",
            "memory:usedPercent.max",
            "memory:usedPercent.min"
          ]
        },
        "values": [
          [
            "us-east-1:12345678:i-99999999",
            "2015-06-03T00:01:00+00:00",
            100.0,
            200.0,
            50.0,
            75.0,
            175.0,
            25.0,
            50,
            75,
            25
          ],
          [
            "us-east-1:12345678:i-88888888",
            "2015-06-03T00:02:00+00:00",
            200.0,
            300.0,
            60.0,
            125.0,
            225.0,
            35.0,
            90,
            100,
            80
          ]
        ]
      }
    ]
  }
}
```

And translating that to a curl command, we have:

```
curl -H "Content-Type: application/json" -XPOST "https://chapi.cloudhealthtech.com/metrics/v1?api_key=<API-KEY>" -d '{"metrics":{"datasets":[{"metadata":{"assetType":"aws:ec2:instance","granularity":"hour","keys":["assetId","timestamp","memory:free.avg","memory:free.max","memory:free.min"]},"values":[["us-east-1:12345678:i-99999999","2015-06-03T00:01:00+00:00",100.0,200.0,50.0],["us-east-1:12345678:i-88888888","2015-06-03T00:02:00+00:00",200.0,300.0,60.0]]}]}}'
```

##POST Response Format
### Success and Partial Failure
If all or some of the posted metrics were accepted by the system, you will receive an HTTP 200 OK response code as well as a JSON message formatted as follows. Note that this API supports partial failure. And if there's partial failure, a 200 response is still returned.

#### Response Format
```
"succeeded": <The total number of rows that were successfully processed>,
"failed": <The total number of rows that were rejected>,
"errors": [
  <A textual description of all errors that prevented the entire payload or an entire dataset from being processed.>
]

# Datasets provide details of failures at the row level within each dataset.
"datasets": [
  {
    "succeeded": <Count of all rows in this dataset that were successfully added to the system."
    "errors": [
        <Textual representation of any errors that prevented all data in this dataset from being processed.>
    ]
    "failures": [
      {
        "error": <Textual representation of any parsing errors that prevented a single row of data from being accepted.>
        "row:" < The original row data that was passed in >
      }
    ]
  }
```

For example:

```
{
  succeeded: 198,
  failed:    2,
  errors:    0,
  datasets:  [
    {
      "succeeeded": 100,
      "errors": [],
      "failures": []
    },
    {
      "succeeeded": 98,
      "errors": [],
      "failures": [
        {
          "error": "Number of values (6) must equal number of keys (5).",
          "row": [
              "us-east-1:12345678:i-99999999",
              "2015-06-03T00:02:00+00:00",
              100,
              75,
              50,
              111
          ]
        },
        {
          "error": "Percentage value (101) is greater than 100.",
          "row": [
              "us-east-1:12345678:i-88888888",
              "2015-06-03T00:02:00+00:00",
              101,
              75
              50
          ]
        },
      ]
    },
  ]
}
```

### Failure
A failure response (either 400 or 500) will be returned if no data could be processed. For instance, if the JSON document was malformed. In general, if you get a 400 response, the problem exists in the payload, and you should be able to rectify it. A 500 response means there was some system failure on the CloudHealth side, and you should not try to resend the data immediately. In both cases, the response body is as follows:

```
{error: { message: <error message>}}
```

For example:
```
{
  error: {
    message: "Invalid credentials"
  }
}
```

## Read API

Currently, you are limited to retrieving metric data for individual assets.  Soon you'll be able to retrieve multiple assets and additional aggregate values.

To retrieve metrics for an asset, simply add an `asset` parameter to the query string and set it equal to the asset's AWS ARN.  For example:

```
curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/metrics/v1?api_key=<YOUR-API-KEY>&asset=arn:aws:ec2:us-east-1:12345678:instance/i-99999999"
```

This will return the first 100 metrics for this instance ordered by the time they were created or last updated.  The response format is very much the same as the POST format, with two notable exceptions.  One, the response is not wrapped in the `metrics` object, and two, there's a root-level `request` object, that contains a `next` link that can be followed to retrieve the next 100 instances.  The `next` attribute will be `null` if there are no more records to retrieve.

```
{
   "request" : {
      "next" : "https://chapi.cloudhealthtech.com/metrics/v1?api_key=<YOUR-API-KEY>&asset=arn%3Aaws%3Aec2%3Aus-east-1%3A12345678%3Ainstance%2Fi-99999999",
   },
   "datasets": [
      "metadata" : {
         "assetType" : "aws:ec2:instance",
         "granularity" : "hour",
         "keys" : [
            "assetId"
            "timestamp",
            "cpu:usedPercent.avg",
            "cpu:usedPercent.max",
            "cpu:usedPercent.min",
            "memory:free.avg",
            "memory:free.max",
            "memory:free.min",
            "memory:usedPercent.avg",
            "memory:usedPercent.max",
            "memory:usedPercent.min",
         ]
      },
      "values" : [
         [ "us-east-1:12345678:i-99999999", "2015-06-08T05:00:00Z", 76, 99, 51, 0, 0, 0, 0, 0, 0 ],
         [ "us-east-1:12345678:i-99999999", "2015-06-08T06:00:00Z", 91, 99, 81, 0, 0, 0, 0, 0, 0 ]
      ]
   ]
}
```

### Pagination
As noted, the default number of records returned is 100.  You can change this to any value between 1 and 500 by adding the `per_page` paramater to the query string.

```
curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/metrics/v1?api_key=<YOUR-API-KEY>&asset=arn:aws:ec2:us-east-1:12345678:instance/i-99999999&per_page=50"
```

You can also specify which page you want to start at with the `page` parameter.

```
curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/metrics/v1?api_key=<YOUR-API-KEY>&asset=arn:aws:ec2:us-east-1:12345678:instance/i-99999999&per_page=50&page=3"
```

If there are no values to display, the `values` array will be empty. If the `next` attribute is `null`, there are no pages beyond the current.

### Time Range
You can limit what time range to retrieve asset information for.  The default is _today_, but you can specify a custom time range with the `time_range` query parameter. `time_range` takes well know strings as arguments. They are enumerated here.and mostly self-explanatory, but for the record, "mtd" = "month to date" and "wtd" = "week to date".

- mtd
- last_month
- last_3_months
- last_6_months
- last_12_months
- wtd
- last_week
- last_2_weeks
- last_4_weeks
- last_52_weeks
- yesterday
- last_2_days
- last_7_days
- last_14_days
- last_31_days

Thus, you can get the month-to-date metrics with this curl command:

```
curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/metrics/v1?api_key=<YOUR-API-KEY>&asset=arn:aws:ec2:us-east-1:12345678:instance/i-99999999&time_range=mtd"
```

### Granularity
The Metrics API currently accepts metrics at an hourly resolution.  However, you can ask for those base metrics to be rolled up to various other resolutions via the `granularity` parameter.  If you don't ask, the default is `hour`.  The addional granularities are:

- day
- week
- month

For example, to request daily rollups of last month's metrics for an instance:

```
curl -H "Accept: application/json" "https://chapi.cloudhealthtech.com/metrics/v1?api_key=<YOUR-API-KEY>&asset=arn:aws:ec2:us-east-1:12345678:instance/i-99999999&time_range=last_month&granularity=day"
```

Note, you want to be sure that `time_range` is large enough to encompass the requested granularity; asking for yesterday's data at a monthly resolution will return no rows -- not an error.  And requesting yesterday's data with a granularity of `day` will return one row.

Further note, that rollups are calculated daily.  You cannot ask for _today's_ data (the default) at any other granularity than hourly (also the default).
