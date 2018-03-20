---
title: Getting Your API Key
category: documentation
position: 3
description: Instructions on how to get your unique API Key for authenticating CloudHealth API calls.
parameters:
  - name:
    content:
content_markdown: |-
  #### How CloudHealth Validates API Requests
  You need an API Key in order to make authenticated requests to the CloudHealth API service.

  An API Key is a globally unique identifier (GUID) that CloudHealth generates for each user in the platform. When you make an API request, this GUID uniquely identifies and authenticates you as the originator of the request.

  To request an API key, click on My Profile in your user settings.

  ![](images/my-profile.png)

  In your profile settings, scroll to the API Key section and click **Get API Key**. Then click **Save Profile Changes**.

  ![](images/api-key.png)

  Include this GUID with each API request to authenticate into the CloudHealth platform.

  #### Periodic Key Rotation
  While securing your API Key is important, it is also essential to periodically rotate your API key for security reasons. To update your key, return to your profile settings and click **Get API Key** to create a new one. Then click **Save Profile Changes**. When you generate an API Key, the previous key becomes invalid.

  The API enforces all the same authentication and authorization checks as the CloudHealth Platform. Therefore, users in an organization can only see data scoped to their organization. Additionally, the API enforces any restrictions to user roles.
---
