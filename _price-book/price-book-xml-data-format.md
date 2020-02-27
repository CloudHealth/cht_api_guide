---
title: Understand Format of Price Book Specification
description: Learn how to format the XML specification that establishes a custom price book.
position: 8
parameters:
- name: CHBillingRules
  required: yes
  content: Top-level element that specifies the customer by name and customer-id, and whether or not the customer gets a EC2 reserved instance volume discount or rate change.
  sub-fields:
   - name: createdBy
     required: no
     content: String of the email address of the author of the XML specification
   - name: date
     required: yes
     content: Date string specified in `yyyy-mm-dd` or `mm/dd/yyyy` of the date the XML specification was created
- name: Comment
  required: no
  content: String for documentation purposes specifying comments on the XML specification. Can be included in any element containing child elements.
- name: RuleGroup
  required: yes
  content: Groups together an ordered set of rules that share a common range of applicable dates. Child element of CHBillingRules.
  sub-fields:
   - name: startDate
     required: no
     content: Date string specified in `yyyy-mm-dd` or `mm/dd/yyyy` of the date the rule group should take effect. If no date is specified, the rule group takes effect for all months.
   - name: endDate
     required: no
     content: Date string specified in `yyyy-mm-dd` or `mm/dd/yyyy` of the date the rule group should cease effect. If no date is specified, the rule group takes effect for all months.
   - name: enabled
     required: no
     content: Boolean field that specifies whether the rule group should be enabled, or `true`, or disabled, or `false`. Default value is `true`.
- name: BillingRule
  required: no
  content: Specifies which products and regions the rule applies to (e.g. which products and regions) and how to apply the discount. Child element of RuleGroup. Discount Rules are evaluated top-down.
  sub-fields:
   - name: name
     required: yes
     content: String specifying the name of the rule for documentation purposes
   - name: includeDataTransfer
     required: no
     content: Boolean field that specifies whether data transfer costs are covered by the rule. Default value is `true`.
   - name: includeRIPurchases
     required: no
     content: Boolean field that specifies whether RI purchases are covered by the rule. Default value is `true`.
- name: BasicBillingRule
  required: no
  content: Specifies either a percentage discount from 0 to 100 or a fixed unit-price or rate. Child element of BillingRule.
  sub-fields:
   - name: billingAdjustment
     required: yes
     content: Numeric string between 0 and 100 specifying the discount or fixed rate amount
   - name: billingRuleType
     required: yes
     content: String specifying whether the discount is `percentDiscount`, `percentIncrease`, or `fixedRate`
- name: Product
  required: no
  content: Specifies the product a rule applies to and any constraints about when the rule should apply to the specified product. Usually a child element of BillingRule.
  sub-fields:
   - name: productName
     required: yes
     content: String specifying the name of the product as it appears in the billing file (case sensitive). Enter `ANY` to apply the rule to all products.
   - name: includeDataTransfer
     required: no
     content: Boolean field that specifies whether data transfer costs are covered for this product. Overrides BillingRule. Default value is `true`.
   - name: includeRIPurchases
     required: no
     content: Boolean field that specifies whether RI purchases are covered for this product. Overrides BillingRule. Default value is `true`.
- name: Region
  required: no
  content: Specifies the region a rule applies to. Usually a child element of Product or BillingRule.
  sub-fields:
   - name: name
     required: yes
     content: String in AWS internal format that specifies the name of the region, such as `us-east-2`. To specify the start of the field, use the format `[key word]*`. To specify the end of the field, use the format `*[key word]`. To specify a key word that appears anywhere in the field, including the start or end, use the format `*[key word]*`.
- name: UsageType
  required: no
  content: Specifies the usage type a rule applies to. Exclude the region on the billing file to apply UsageType to all regions and include the region to limit UsageType to that region. Child element of Product.
  sub-fields:
   - name: name
     required: yes
     content: String specifying the usage type name, formatted to match the usage type name on the billing file without the instance-type prefixes and suffixes. To specify the start of the field, use the format `[key word]*`. To specify the end of the field, use the format `*[key word]`. To specify a key word that appears anywhere in the field, including the start or end, use the format `*[key word]*`.
- name: Operation
  required: no
  content:  Specifies the operations a rule applies to. Child element of Product.
  sub-fields:
   - name: name
     required: yes
     content: String specifying the operation name, formatted to match the operation name on the billing file. To specify the start of the field, use the format `[key word]*`. To specify the end of the field, use the format `*[key word]`. To specify a key word that appears anywhere in the field, including the start or end, use the format `*[key word]*`.
- name: RecordType
  required: no
  content: Specifies the record types, or line item types, a rule applies to. Child element of Product.
  sub-fields:
   - name: name
     required: no
     content: String specifying the start, end, or key word in the RecordType field. To specify the start of the field, use the format `[key word]*`. To specify the end of the field, use the format `*[key word]`. To specify a key word that appears anywhere in the field, including the start or end, use the format `*[key word]*`.
- name: InstanceProperties
  required: no
  content: Specifies whether the rule applies to the product for specific instance types and sizes and for reservations. Child element of Product.
  sub-fields:
   - name: instanceType
     required: no
     content: String specifying the instance type the rule applies to for this product, such as `t2`
   - name: instanceSize
     required: no
     content: String specifying the instance size the rule applies to for this product, such as `8xlarge`
   - name: reserved
     required:
     content: Boolean field that specifies whether the rule applies to only reserved instances. Default value is `false`.
- name: LineItemDescription
  required: no
  content: Specifies a constraint on which products a rule applies to based on the contents of the line item description field in the billing file. Child element of Product.
  sub-fields:
   - name: name
     required: no
     content: String specifying the start, end, or key word in the line item description field. To specify the start of the field, use the format `[key word]*`. To specify the end of the field, use the format `*[key word]`. To specify a key word that appears anywhere in the field, including the start or end, use the format `*[key word]*`.
   - name: startsWith
     required: no
     content: String specifying the start of the line item description field
   - name: contains
     required: no
     content: String specifying keywords in the line item description field
   - name: matchesRegex
     required: no
     content: A Java string specifying a regular expression matching the line item description field

content_markdown: |-
  Familiarize yourself with the format of the XML specification that you can post to define the custom price book for a customer.

  **XML Formatting:**
  XML is a file format that allows you to enter markup language that is both human-readable and machine-readable. Custom price book specifications are written in XML. To write your specifications, you need an XML editor. If you don’t already have an XML editor, CloudHealth recommends [XML Spear](http://www.donkeydevelopment.com/).

  **Rule Order:**
  Custom price book XML specifications process rules in top-down order. The first applicable rule that satisfies all specified constraints for a line item is used, and then no subsequent rules are used for that line item. If no applicable and matching rule is found, the line item will have a 0% calculated price adjustment.

  **Rule Applicability:**
  Rule applicability is determined by the startDate and endDate attributes in enabled RuleGroup elements. startDates and endDates are inclusive. Whether or not an applicable rule is actually used depends on its order relative to other rules and the constraints it specifies for matching line items.

  **Example:**

  ```
  <CHBillingRules createdBy=\"user@partner.com\" date=\"2018-01-01\">
    <Comment>This is the Price Book specification for a Customer</Comment>

    <RuleGroup>

      <BillingRule name=\"10% on EC2\" includeDataTransfer=\"true\">
      <BasicBillingRule billingAdjustment=\"10.0\" billingRuleType=\"percentDiscount\"/>
        <Product productName=\"Amazon Elastic Compute Cloud\"/>
      </BillingRule>

      <BillingRule name\"$0.50 flat rate for CloudFront\">
      <BasicBillingRule billingAdjustment=\"0.5\" billingRuleType=\"fixedRate\"/>
        <Product productName=\"Amazon CloudFront\"/>
      </BillingRule>

      <BillingRule name=\"10% markup on RDS charges in us-east-1\">
      <BasicBillingRule billingAdjustment=\"10.0\" billingRuleType=\"percentIncrease\">
        <Product productName=\"Amazon Relational Database System\">
          <Region name=\"us-east-1\"/>
        </Product>
      </BillingRule>

    </RuleGroup>

  </CHBillingRules>
  ```
---
