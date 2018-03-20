---
title: Understand Time Filters
position: 11
description: Familiarize yourself with how time filters work when used with the Reporting API.
parameters:
  - name:
    content:
content_markdown: |-
  Filtering on the time dimension is a common technique for reducing the data returned from a report query. For example, you might want to get report data for last month, this quarter, or the previous year.

  The time dimension is unique because it is ordinal. So one way to filter by this dimension is to provide an index value that indicates position. You can specify an Absolute Time Index (positive integers) or a Relative Time Index (negative integers).

  ![](images/time-indexes.png)

  #### Example: Get Data for Current Month
  * Using Relative Time Index
    ```
    &interval=monthly&filters[]=time:select:-1
    ```
  * Using Absolute Time Index
    ```
    &interval=monthly&filters[]=time:select:12
    ```

  #### Example: Get Data for Past Three Months
  * Using Relative Time Index
    ```
    &interval=monthly&filters[]=time:select:-1,-2,-3
    ```
  * Using Absolute Time Index
    ```
    &interval=monthly&filters[]=time:select:12,11,10
    ```

  If you are only `select`-ing months (not weeks, days, or hours) and not `reject`-ing months, you can specify the dimension as a date string instead of an index. The date string has the format `YYYY-MM`. You can use this approach to filter out all months except for the current month.
  ```
  &interval=monthly&filters[]=time:select:2014-12
  ```

  You cannot mix and match date strings and indexes in a single filter.
  {:.warning}

  Weekly, daily, and hourly (for reports that provide this interval) intervals work similarly. However, the amount of data retrieved for each interval is different.

  | Interval | Units | Relative Index |
  |----|----|----|
  | `monthly` | 12 months | `-1` returns Current month  |
  | `weekly` | 52 weeks | `-1` returns the previous full week |
  | `daily` | 31 days | `-1` returns the previous full day |
  | `hourly` | 84 hours | `-1` returns from 10 PM to 11:59 PM UTC the day before (each member has two hours of data) |
---
