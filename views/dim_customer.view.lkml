view: dim_customer {
  sql_table_name: `the_tile_shop_poc.dim_customer`
    ;;

  dimension: ascustomer_name {
    type: string
    sql: ${TABLE}.ASCustomer_Name ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.Customer_ID ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.Postal_Code ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.Segment ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  measure: count {
    type: count
    drill_fields: [ascustomer_name]
  }
}
