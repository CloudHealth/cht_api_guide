---
title: Create New Partner Billing Rule
position: 4
description: Add a new partner billing rule in the CloudHealth Platform.
type: post
endpoint: https://chapi.cloudhealthtech.com/v1/partner_billing_rules
parameters:
  - name: name
    required: yes
    content: String that specifies the unique name of the billing rule.
  - name: cloud
    required: yes
    content: Specify the cloud the billing rule applies to as either `aws` or `azure`.
  - name: add_target_customers
    required: no
    content: Enter the client API keys of the AWS customers that the billing rule applies to. To apply the rule to all customers, enter `all`.
  - name: add_enterprise_agreements
    required: no
    content: Specify which EA customers the billing rule applies to. Enter the EA's client API key and the Azure EA ID in a comma-separated list.
  - name: add_csp_customers
    required: no
    content: Enter the client API keys of the Microsoft CSP customers that the billing rule applies to. To apply the rule to all customers, enter `all`.
  - name: billing_rule_type
    required: yes
    content: Specify whether the billing rule is `custom` (a custom line item) or `support` (an AWS support rule). You can only create an AWS support rule for a rule whose cloud is `aws`.
  - name: rule_action
    required: yes
    content: String that specifies what action the billing rule should take. For custom line items, enter `flat_fee` (flat fee charge or credit) or `spend_ratio` (percentage of spend charge or credit). For AWS support rules, enter `flat_fee` (flat fee charge), `list_price` (AWS list price charge), `percentage_discount` (percentage discount charge), `suppress_charge` (charges suppressed for this item), or `custom_tier` (custom pricing charge).
  - name: rule_scope
    required: no
    content: Specify whether the scope of an AWS Support billing rule is `per_account` or `per_billing_family`. Default value is `per_account`.
  - name: support_tier
    required: no
    content: Specify whether the support tier of an AWS Support billing rule is `developer`, `business`, or `enterprise`. Default value is `developer`.
  - name: flat_fee_cost
    required: no
    content: For AWS support rules with a rule action of `flat_fee`, specify the flat fee charge amount. Required for flat fee AWS support rules.
  - name: charge_percentage_discount
    required: no
    content: For AWS support rules with a rule action of `percentage_discount`, specify the percentage discount charge amount. Required for percentage discount AWS support rules.
  - name: pricing_info
    required: no
    content: For AWS support rules with a rule action of `custom_tier`, specify in a JSON array the custom pricing structure. Custom tier pricing is structured as either a flat fee or a percentage of monthly AWS usage in four tiered spend ranges, whichever is greater. For example, the greater of either $100 or 10% for monthly AWS usage $0-$10,000; 7% for $10,000-$80,000; 5% for $80,000-$250,000; 3% for $250,000 and up. See [AWS Support Plan Pricing](https://aws.amazon.com/premiumsupport/pricing/) for more information on AWS Support custom pricing. Required for custom tier pricing AWS support rules.
    sub-fields:
      - name: min_fee
        required: yes
        content: Enter the flat fee that should be charged if the percentage of AWS spend is lower than this amount. For example, `100`.
      - name: min_spend_range
        required: yes
        content: Enter the lower AWS spend range for each of the four spend range tiers in a comma-separated list. For example, `[0, 10000, 80000, 250000]`
      - name: min_spend_rate
        required: yes
        content: Enter the percentage charged to each of the four AWS spend range tiers in a comma-separated list. For example, `[10,7,5,3]`.
  - name: start_month
    required: no
    content: For custom line items, specify the month the billing rule should take effect. The date string has the format `YYYY-MM`. Default value is the current month.
  - name: frequency
    required: no
    content: For custom line items, specify whether the billing rule is `one_time` or `recurring`. Default value is `one_time`.
  - name: product_name
    required: no
    content: For custom line items, specify the product name of the billing rule. This name appears as a line item in the customer's bill. Required for custom line items.
  - name: product_description
    required: no
    content: For custom line items, specify the product description of the billing rule. This description appears in the line item in the customer's bill. Required for custom line items.
  - name: type
    required: no
    content: For custom line items, specify whether the billing rule is a `charge` or `credit`. Default value is `charge`.
  - name: apply_flat_fee_cost
    required: no
    content: For custom line items with a rule action of `flat_fee`, enter specify the flat fee amount.  Required for flat fee custom line item rules.
  - name: apply_rate_in_percentage
    required: no
    content: For custom line items with a rule action of `spend_ratio`, specify the percentage of spend amount. Required for percentage of spend custom line item rules.
  - name: add_spend_ratio_as_custom_line_item
    required: no
    content: For Azure custom line items with a rule action of `spend_ratio`, specify whether to apply the percentage credits and charges once to the main subscription (`true`) or to each line item in the bill (`false`). The default value is `false`.
right_code_blocks:
  - code_block: |-
      {
        "name": "Business support",
        "cloud": "aws",
        "billing_rule_type": "custom_tier",
        "add_target_customers": [1,2,3],
        "rule_action": "custom_tier",
        "rule_scope": "per_billing_family",
        "support_tier": "business",
        "pricing_info":{
          "min_fee": 100,
          "min_spend_range":[0,10000, 80000, 250000],
          "min_spend_rate": [10,7,5,3]
        }
      }
    title: Request Body for AWS Support Rule
    language: json
  - code_block: |-
      {
        "name": "Customer markup",
        "add_target_customers": [1,2,3],
        "cloud": "aws",
        "billing_rule_type": "custom",
        "rule_action": "spend_ratio",
        "start_month": "2019-05",
        "frequency": "recurring",
        "product_name": "markup",
        "product_description": "markup",
        "type": "charge",
        "apply_rate_in_percentage": 5
      }
    title: Request Body for AWS Custom Line Item
    language: json
  - code_block: |-
      {
        "name": "Customer markup",
        "add_csp_customers":[3,4]
        "add_enterprise_agreements": {<client_api_key>:[234,456], "2":[457,890]},
        "billing_rule_type": "custom",
        "cloud": "azure",
        "rule_action": "flat_fee",
        "start_month": "2019-05",
        "frequency": "recurring",
        "product_name": "markup",
        "product_description": "markup",
        "type": "charge",
        "apply_flat_fee_cost": 1000
      }
    title: Request Body for Azure Custom Line Item
    language: json
  - code_block: |-
      {
        "name": "Customer markup",
        "product_name": "markup",
        "product_description": "markup",
        "rule_scope": "per_account",
        "billing_rule_type": "custom",
        "cloud": "aws",
        "target_customers": [1,2,3],
        "start_month": "2019-05",
        "frequency": "recurring",
        "type": "charge",
        "rate_in_percentage": 5
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request POST -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        '{
          "name": "Customer markup",
          "add_target_customers": [1,2,3],
          "cloud": "aws",
          "billing_rule_type": "custom",
          "rule_action": "spend_ratio",
          "start_month": "2019-05",
          "frequency": "recurring",
          "product_name": "markup",
          "product_description": "markup",
          "type": "charge",
          "apply_rate_in_percentage": 5
        }'    
          'https://chapi.cloudhealthtech.com/v1/partner_billing_rules'
    title: Sample Request
    language: bash
---
