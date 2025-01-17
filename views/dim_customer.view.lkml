view: dim_customer {
  sql_table_name: `the_tile_shop_poc.dim_customer`
    ;;

  dimension: customer_name {
    type: string
    sql: ${TABLE}.Customer_Name ;;
    html: <a href="/dashboards-next/120?Customer+Name={{ value }}">{{ value }}</a> ;;
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
    map_layer_name: us_zipcode_tabulation_areas
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

  dimension: customer_trips {
    type: number
    sql: ${TABLE}.customers_trips ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.State ;;
    html:
    <a href="/dashboards-next/98?State={{ value }}">{{ value }}</a> ;;
  }

  dimension: city_state {
    type: string
    sql: ${city} || ", " || ${state} ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name]
  }
}
