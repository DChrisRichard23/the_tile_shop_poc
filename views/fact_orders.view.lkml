view: fact_orders {
  sql_table_name: `the_tile_shop_poc.fact_orders`
    ;;

  dimension: customer_id {
    type: string
    hidden:  yes
    sql: ${TABLE}.Customer_ID ;;
  }

  measure: customers {
    type: count_distinct
    sql: ${customer_id} ;;
    value_format_name: decimal_0
  }

  dimension: discount_in {
    type: number
    hidden: yes
    sql: ${TABLE}.Discount ;;
  }

  dimension: discount_amount_in {
    type: number
    hidden: yes
    sql: ${sales_in}*${discount_in} ;;
    value_format: "$#,##0.00"
  }

  measure: discount_amount {
    type: sum
    sql: ${discount_amount_in} ;;
    value_format: "$#,##0.00"
  }

  measure: discount_pct {
    type: number
    sql: (${discount_amount}/${sales})*100 ;;
    value_format: "0.00\%"
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Order_Date ;;
  }

  dimension: order_month_num {
    type: number
    sql: ${TABLE}.order_month_num ;;
  }


  dimension: order_to_ship_duration {
    type: number
    sql: DATE_DIFF(${TABLE}.Ship_Date, ${TABLE}.Order_Date, DAY) ;;
    value_format_name: decimal_0
  }


  measure: months {
    type: count_distinct
    sql: FORMAT_TIMESTAMP('%Y-%m', CAST(fact_orders.Order_Date  AS TIMESTAMP)) ;;
    value_format_name: decimal_0
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.Order_ID ;;
  }

  measure: orders {
    type: count_distinct
    sql: ${order_id} ;;
    value_format_name: decimal_0
  }

  measure: orders_percent_of_total {
    type: percent_of_total
    sql: ${orders} ;;
    value_format: "0.00\%"
  }

  dimension: product_id {
    type: string
    hidden:  yes
    sql: ${TABLE}.Product_ID ;;
  }

  measure: products {
    type: count_distinct
    sql: ${product_id} ;;
    value_format_name: decimal_0
  }

  dimension: profit_in {
    type: number
    hidden: yes
    sql: ${TABLE}.Profit ;;
  }

  measure: profit {
    type: sum
    sql: ${profit_in} ;;
    value_format: "$#,##0.00"
  }

  dimension: quantity_in {
    type: number
    hidden: yes
    sql: ${TABLE}.Quantity ;;
  }

  measure: quantity {
    type: sum
    sql: ${quantity_in} ;;
    value_format: "#,##0"
  }

  measure: quantity_per_order {
    type: number
    sql: ${quantity}/${orders} ;;
    value_format: "#,##0.00"
  }

  dimension: row_id {
    type: number
    hidden:  yes
    sql: ${TABLE}.Row_ID ;;
  }

  dimension: sales_in {
    type: number
    hidden: yes
    sql: ${TABLE}.Sales ;;
  }

  measure: sales {
    type: sum
    sql: ${sales_in} ;;
    value_format: "$#,##0.00"
  }

  dimension: item_cost {
    type: number
    sql: ${sales_in}/${quantity_in} ;;
    value_format: "$#,##0.00"
  }

  measure: sales_per_quantity {
    type: number
    sql: ${sales}/${quantity} ;;
    value_format: "$#,##0.00"
  }

  dimension: sales_per_quantity_tier {
    type: tier
    tiers: [0,50,100,200,500,1000]
    sql: ${item_cost} ;;
    value_format: "$#,##0"
  }

  measure: sales_per_order {
    type: number
    sql: ${sales}/${orders} ;;
    value_format: "$#,##0.00"
  }

  measure: sales_per_customer {
    type: number
    sql: ${sales}/${customers} ;;
    value_format: "$#,##0.00"
  }

  dimension_group: ship {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Ship_Date ;;
  }

  dimension: ship_mode {
    type: string
    sql: ${TABLE}.Ship_Mode ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
