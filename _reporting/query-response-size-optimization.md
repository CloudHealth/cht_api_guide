---
title: Query Response Size Optimization
description: Multidimensional queries, by default, return a complete response across all the dimensions. Depending on the complexity of the report query, the result can return a much larger dataset. This dataset may include arrays containing only null values. To optimize the response to such queries, CloudHealth has introduced a new boolean parameter `collapse_null_arrays`. If specified in the query, arrays with all the cost values as null would collapse to a single null value, thus significantly reducing the query response size. Consider the following example to understand how this parameter works.
position: 4
parameters:
  - name:
    content:
content_markdown: |-
  Following is the example of a 3-D query over time/accounts/services, with slicing on time and AWS service categories. 
    ```
    curl -X GET -H 'Authorization: Bearer <Your API Key>' -H 'Content-Type: application/json' "https://chapi.cloudhealthtech.com/olap_reports/cost/history?\
      interval=monthly&\
      dimensions\[\]=AWS-Service-Category&\
      dimensions\[\]=time&\
      dimensions\[\]=AWS-Account&\
      measures\[\]=cost&\
      filters\[\]=time:select:-5,-1&\
      filters\[\]=AWS-Service-Category:select:ec2_compute,nat_gateway_transfer,ec2_transfer,ebs_storage,nat_gateway_usage,ebs_io&\
      NO_CACHE=1"
    ```
   Note that the **Data** node in the query response may have multiple 2-D arrays with all cost values as `null`, leading to an unnecessary increase in the data size to 345 KB. 
   ```
   "data": [
                [
                    [
                        [
                            2936970.8662986687
                        ],
                        [
                            2303183.584927046
                        ],
                        [
                            440173.0578069503
                        ],
                        [
                            26266.99529305149
                        ],
                        [
                            61661.31648144288
                        ],
                        [
                            77100.0010629067
                        ],
                        [
                            null
                        ],
                        [
                            19137.5030886411
                        ],
                        [
                            2039.3415658562
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            7409.0660727718
                        ]
                    ],
                    [
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ]
                    ],
                    
                    ...

                ]
            ]
   ```
   Now, append the `collapse_null_arrays` parameter to the same query. 
   ```
   curl -X GET -H 'Authorization: Bearer <Your API Key>' -H 'Content-Type: application/json'    "https://chapi.cloudhealthtech.com/olap_reports/cost/history?\
    interval=monthly&\
    dimensions\[\]=AWS-Service-Category&\
    dimensions\[\]=time&\
    dimensions\[\]=AWS-Account&\
    measures\[\]=cost&\
    filters\[\]=time:select:-5,-1&\
    filters\[\]=AWS-Service-Category:select:ec2_compute,nat_gateway_transfer,ec2_transfer,ebs_storage,nat_gateway_usage,ebs_io&\
    NO_CACHE=1&\
    collapse_null_arrays=1"
    ```
   The query retrieves a simplified response as compared to the original query response by replacing the 2-D null arrays with a single null value.
    ```
    "data": [
                [
                    [
                        [
                            2936970.8662986687
                        ],
                        [
                            2303183.584927046
                        ],
                        [
                            440173.0578069503
                        ],
                        [
                            26266.99529305149
                        ],
                        [
                            61661.31648144288
                        ],
                        [
                            77100.0010629067
                        ],
                        [
                            null
                        ],
                        [
                            19137.5030886411
                        ],
                        [
                            2039.3415658562
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            null
                        ],
                        [
                            7409.0660727718
                        ]
                    ],
                    null,
                    
                    ...

                ]
            ]
  ```
  After adding the `collapse_null_arrays` parameter, the resultant response size is 43 KB, much less than the original query response. The parameter only makes changes in the response format and returns the data that is useful to you.

  #### NOTE:
   * To process the new result set, you need to add a simple nil check to the logic.
   * Since the response to 3D and 4D queries can be very large, verifying a small data set by appending the `collapse_null_arrays` parameter is recommended before submitting the larger requests.
---