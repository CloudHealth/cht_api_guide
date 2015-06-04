#CloudHealth Metrics API -- ALPHA

The CloudHealth Metrics API allows you to upload various system metrics to CloudHealth. By doing so, you will not only have a better view into the health and performance of your systems, but CloudHealth will be able to generate better rightsizing recommendations.

Sending us metrics is as simple as POSTing a JSON document to the /metrics/v1 endpoint.  The JSON format is described below.

##Current Limitations
In this early release there are a few limitations on what we can accept.
- You may post CPU, memory, and disk metrics only
- Metrics must be at an hourly resolution
- You may post only AWS metrics
- TBD: CLOUDWATCH, THE PAST

In the near future, we will support metrics for a larger variety of assets, 15 minute resolutions, and metrics from other cloud providers and local datacenters.

Also note that at this time, this is a write-only API.  Very shortly, we will introduce the read facilities.  In the meantime, you'll be able to view your posted metrics in the CloudHealth user interface.

##POST Data Format
To send system metrics to CloudHealth you need to provide us with a collection of `datasets`.  Each dataset consists of a `metadata` header describing the data being sent, and an array of `values` that actually is the data.  Each dataset describes a single asset type; instance or volume, currently.  If you care to send us data about multiple asset types, you'll need one dataset for each.

A collection of one or more datasets is bound up in a hash rooted with the *metrics* element.

```
"metrics": {
  "datasets": []
}
```

Each dataset is a hash consisting of metadata and an array of values.  Each element in the values array is itself an array of metrics for a given interval and instance/volume:

```
{
  "metadata": {},
  "values": [
    [],
  ]
}
```

The metadata hash describes the data you are sending.  It consists of an asset type, the granularity of the included data, and an array of keys that describes the 'type' of each element in the values array.

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
- aws:ec2:volume

The supported granularities are as follows:
- hour

The complete list of supported keys is as follows:
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

- memory:freePercent.avg
- memory:freePercent.min
- memory:freePercent.max

- memory:usedPercent.avg
- memory:usedPercent.min
- memory:usedPercent.max

The `values` array has an entry for each series of metrics you care to send us.  Each entry is itself an array of metrics corresponding to the elements in the `keys` array -- in the same order and of the same length!

Each array of metrics species the instance (using a compact form of the AWS ARN format), a timestamp (in ISO-8601 format), and the supplied metrics (numbers -- integer or float). A single array of metrics can contain information about CPU and/or memory if the asset type is an instance, or disk if the asset type is a volume).  Each instance or granularity is a new array of values.

```
"values": [
  [
    "aws:ec2:us-east-1:i-a99a99a9", "2015-06-03T00:01:00+00:00", 200, 400, ...],
    "aws:ec2:us-east-1:i-a99a99a9", "2015-06-03T00:02:00+00:00", 100, 300, ...],
  ]
]
```

Pulling this all together we have:

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
            "memory:freePercent.avg",
            "memory:freePercent.max",
            "memory:freePercent.min"
          ]
        },
        "values": [
          [
            "us-east-1:123:i-99999999",
            "2015-06-03T00:01:00+00:00",
            100.0,
            200.0,
            50.0,
            50,
            75,
            25
          ],
          [
            "us-east-1:123:i-88888888",
            "2015-06-03T00:02:00+00:00",
            200.0,
            300.0,
            60.0,
            90,
            100,
            80
          ]
        ]
      }
    ]
  }
}

And translating that to a curl command, we have:

curl -H "Content-Type: application/json" -XPOST "http://chapi.cloudhealthtech.com/metrics/v1?api_key=<API-KEY>" -d '{"metrics":{"datasets":[{"metadata":{"assetType":"aws:ec2:instance","granularity":"hour","keys":["assetId","timestamp","memory:free.avg","memory:free.max","memory:free.min"]},"values":[["us-east-1:123:i-99999999","2015-06-03T00:01:00+00:00",100.0,200.0,50.0],["us-east-1:123:i-88888888","2015-06-03T00:02:00+00:00",200.0,300.0,60.0]]}]}}'

##POST Response Format
### Success and Partial Failure
If all or some of the posted metrics were accepted by the system we will return an HTTP 200 OK response code as well as a JSON message formatted as follows:

```
{
  succeeded: <number of accepted rows of data>,
  failed:    <number of denied rows of data>
  failures: [
    {
      data: <a copy of the failed data set>,
      reason: <the reason for failure>
    }
  ]
}
```

For example:

```
{
  succeeded: 198,
  failed:    2,
  failures: [
    {
      data: 100, 200, 300, 40, 50
      reason: "Number of data elements did not match the number of keys."
    }
    {
      data: 100, 200, 300, 40, 50, 'AAA'
      reason: "Element 'AAA' is not a number."
    }
  ]
}
```

### Failure
A failure response (either 400 or 500) will be returned if no data could be processed.  For instance, if the JSON document was malformed.  In general, if you get a 400 response, the problem exists in the payload, and you should be able to rectify it.  A 500 response means there was some system failure on the CloudHealth side, and you should not try to resend the data immediately.  In both cases, the response body is as follows:

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
