connection: "the_tile_shop_poc"

# include all the views
include: "/views/**/*.view"

datagroup: the_tile_shop_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: the_tile_shop_poc_default_datagroup


explore: fact_orders {
  label: "orders"
  join: dim_customer {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_orders.customer_id} = ${dim_customer.customer_id} ;;
  }
  join: dim_product {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_orders.product_id} = ${dim_product.product_id} ;;
  }
  join: dim_order_date {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_orders.order_date} = ${dim_order_date.order_date} ;;
  }
  join: dim_ship_date {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_orders.ship_date} = ${dim_ship_date.ship_date} ;;
  }

}
