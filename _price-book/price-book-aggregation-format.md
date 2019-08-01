---
title: Understand Price Book Test Results
description: Learn how to review the results of the custom price book XML specification test.
position: 10

content_markdown: |-
  Familiarize yourself with the format of the custom price book XML specification test results that you can verify whether the custom price book is accurate before you assign the price book to customers.

  **Test Result Formats:** Test results are returned in aggregations that contain the calculated discounts and rates according to the custom price book XML specification. Three aggregations are provided in the following hierarchy:
  - Product-level
  - Usage type-level
  - Operation level

  **Review and Revise:**
  Review the three aggregations and verify whether all discounts, rates, and adjustments for each product appear as expected. If any of the discounts, rates, or adjustments are incorrect, then there are mistakes present in the XML specification that must be corrected. There are several possible reasons why the XML specification is incorrect:
  - The data was incorrectly entered into the XML specification. Review the XML specification and verify that all discount, rate, and adjustment amounts are correct for each product.
  - The order is incorrect. The XML specification evaluates each rule in top-down order. Once a product has a discount, rate, or adjustment applied to it, the XML specification ignores all further price adjustments applied to that product. Verify that the rule order is correct in the XML specification.
  - The product name is misspelled. The productName attribute must exactly match the product name in the billing file and is case sensitive. For example, a discount to `Amazon Elastic Compute cloud` will be ignored because the last word in the product name isn't properly capitalized. Verify that all product names in the XML specification are correctly spelled and formatted.

  Once you have corrected the XML specification, modify the custom price book in CloudHealth and rerun the test.
---
