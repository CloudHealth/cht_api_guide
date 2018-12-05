---
title: Introduction to Reporting API
position: 1
description: An introduction to the Reporting API and common terminology.
parameters:
  - name:
    content:
content_markdown: |-
  The Reporting API allows REST-based access to data presented in OLAP CloudHealth Reports through this endpoint.

  https://chapi.cloudhealthtech.com/olap_reports

  #### Which Reports are Queryable
  You can only retrieve data presented in OLAP reports. These are reports that are:
  * available at the `/olap_reports` endpoint (including the Container Cost History report), and
  * present data visually through charts and graphs

  #### Reporting Terminology
  Familiarize yourself with the terminology specific to this API.

  - **Report name:** The display name of the report (e.g., Instance Usage).
  - **Dimensions:** Available members for the X-axis and categorization (e.g. by Days categorized by Reservation Type).
  - **Intervals:** The granularity of the report (e.g., monthly, weekly, or hourly).
  - **Measures:** Selected measures (e.g. # Instances).
  - **Filters:** User-defined filters for the report.
  - **Data:** The data that is returned when requesting a report.

  See how these terms match to elements of the Report interface in the CloudHealth Platform.

  ![](images/report-terms.png)
---
