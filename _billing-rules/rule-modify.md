---
title: Modify Existing Billing Rule
position: 5
description: Modify an existing billing rule in the CloudHealth Platform. You cannot modify the billing rule's cloud, billing rule type, or rule action.
type: put
endpoint: https://chapi.cloudhealthtech.com/v1/partner_billing_rules/:partner_billing_rule_id
parameters:
  - name: name
    required: yes
    content: String that specifies the unique name of the billing rule.
  - name: add_target_customers
    required: no
    content: Enter the client API keys of the AWS customers that the billing rule applies to. To apply the rule to all customers, enter `all`.
  - name: remove_target_customers
    required: no
    content: Enter the client API keys of the AWS customers that should be removed from the billing rule.
  - name: add_enterprise_agreements
    required: no
    content: Specify which EA customers the billing rule applies to. Enter the EA's client API key and the Azure EA ID in a comma-separated list.
  - name: remove_enterprise_agreements
    required: no
    content: Specify which EA customers should be removed from the billing rule. Enter the EA's client API key and the Azure EA ID in a comma-separated list.
  - name: add_csp_customers
    required: no
    content: Enter the client API keys of the Microsoft CSP customers that the billing rule applies to. To apply the rule to all customers, enter `all`.
  - name: remove_csp_customers
    required: no
    content: Enter the client API keys of the Microsoft CSP customers that should be removed from the billing rule.
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
        "name": "Customer markup 23",
        "add_enterprise_agreements": {"1":[2]},
        "remove_csp_customers":[111]
        "start_month": "2019-06",
        "frequency": "one_time",
        "apply_rate_in_percentage": 4
      }
    title: Request Body
    language: json
  - code_block: |-
      {
        "id": 1,
        "name": "Customer markup 23",
        "product_name": "markup",
        "product_description": "markup",
        "billing_rule_type": "custom",
        "cloud": "azure",
        "csp_customers": [1,2],
        "enterprise_agreements":{"1":[2]},
        "start_month": "2019-06",
        "frequency": "one_time",
        "type": "charge",
        "rate_in_percentage": 4,
        "add_spend_as_custom_line_item": true
      }
    title: Response Body
    language: json
  - code_block: |-
      curl --request PUT -H 'Authorization: Bearer <your_api_key>' -H 'Content-Type: application/json' -d
        '{
          "name": "Customer markup 23",
          "add_enterprise_agreements": {"1":[2]},
          "remove_csp_customers":[111]
          "start_month": "2019-06",
          "frequency": "one_time",
          "apply_rate_in_percentage": 4
        }'
          'https://chapi.cloudhealthtech.com/v1/partner_billing_rules/<partner_billing_rule_id>'
    title: Sample Request
    language: bash
---
