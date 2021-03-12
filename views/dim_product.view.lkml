view: dim_product {
  sql_table_name: `the_tile_shop_poc.dim_product`
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.Product_ID ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }

  dimension: product_sold_count {
    type: number
    sql: ${TABLE}.Product_Sold_Count ;;
  }

  dimension: total_product_sales {
    type: number
    sql: ${TABLE}.Total_Product_Sales ;;
    value_format: "$#,##0.00"
  }

  dimension: total_product_sales_tier {
    type: tier
    tiers: [0,300,1000,3000,10000,30000]
    sql: ${total_product_sales} ;;
    value_format: "$#,##0"
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.Sub_Category ;;
    html:
    <a href="/dashboards-next/97?Sub+Category={{ value }}">{{ value }}</a> ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
