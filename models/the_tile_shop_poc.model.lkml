connection: "the_tile_shop_poc"

# include all the views
include: "/views/**/*.view"

datagroup: the_tile_shop_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: the_tile_shop_poc_default_datagroup

explore: dim_customer {}

explore: dim_product {}

explore: fact_orders {}
