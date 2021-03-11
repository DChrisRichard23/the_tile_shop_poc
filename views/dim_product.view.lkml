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

  dimension: sub_category {
    type: string
    sql: ${TABLE}.Sub_Category ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
