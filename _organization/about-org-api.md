---
title: Introduction to Organization API
position: 1
description: An introduction to the Organization API.
parameters:
  - name:
    content:
content_markdown: |-
  Organizations allow customers to limit the visibility of the data available to users in the CloudHealth Console. Using organizations, you can grant multiple stakeholders access to CloudHealth without providing them access to data you do not wish them to see (e.g. the marketing department should see only the infrastructure running on behalf of marketing).

  To create an organization, you associate it with one or more accounts containing the data you want visible. Organizations may have overlapping data (e.g. both your Engineering and DevOps organizations might have access to a common set of accounts).

  By default, every company has one default organization that contains all accounts and their corresponding assets. You can modify and assign accounts to the default organization only through the CloudHealth Platform.

  For more information on organizations, see the [Organizations, Users, and Roles](https://help.cloudhealthtech.com/administration/users-and-roles.html) topic.

  The Organization API allows admin users to create, modify, and delete organizations and assign AWS, Azure, GCP, and Data Center accounts to organizations. Users can assign Chef and Datadog accounts to an organization only through the CloudHealth Platform. In order to use some Organization endpoints, you need to provide the `org_id`. CloudHealth generates a unique ID for each organization. See [How to Get Organization ID](#organization_how-to-get-organization-id).
---
