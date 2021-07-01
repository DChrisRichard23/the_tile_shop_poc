view: dim_order_date {
  sql_table_name: `mw-data-analytics-sandbox.the_tile_shop_poc.dim_order_date`
    ;;

  dimension_group: order {
    type: time
    timeframes: [
      date
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_day_of_week_name {
    type: string
    order_by_field: order_day_of_week_num
    sql: ${TABLE}.order_day_of_week_name ;;
  }

  dimension: order_day_of_week_num {
    type: number
    sql: ${TABLE}.order_day_of_week_num ;;
  }

  dimension: order_day_of_week_num_name {
    type: string
    order_by_field: order_day_of_week_num
    sql: ${TABLE}.order_day_of_week_num_name ;;
  }

  dimension: order_day_of_week_short {
    type: string
    order_by_field: order_day_of_week_num
    sql: ${TABLE}.order_day_of_week_short ;;
  }

  dimension: order_full_date_description {
    type: string
    order_by_field: order_date
    sql: ${TABLE}.order_full_date_description ;;
  }

  dimension: order_month_name {
    type: string
    order_by_field: order_month_num
    sql: ${TABLE}.order_month_name ;;
  }

  dimension: order_month_name_short {
    type: string
    order_by_field: order_month_num
    sql: ${TABLE}.order_month_name_short ;;
  }

  dimension: order_month_num {
    type: number
    sql: ${TABLE}.order_month_num ;;
  }

  dimension: order_month_num_name {
    type: string
    order_by_field: order_month_num
    sql: ${TABLE}.order_month_num_name ;;
  }

  dimension: order_month_year {
    type: string
    order_by_field: order_year_month
    sql: ${TABLE}.order_month_year ;;
  }

  dimension: order_quarter_name {
    type: string
    order_by_field: order_quarter_num
    sql: ${TABLE}.order_quarter_name ;;
  }

  dimension: order_quarter_num {
    type: number
    sql: ${TABLE}.order_quarter_num ;;
  }

  dimension: order_quarter_year_name {
    type: string
    order_by_field: order_year_quarter
    sql: ${TABLE}.order_quarter_year_name ;;
  }

  dimension: order_week_name {
    type: string
    order_by_field: order_week_number
    sql: ${TABLE}.order_week_name ;;
  }

  dimension: order_week_number {
    type: number
    sql: ${TABLE}.order_week_number ;;
  }

  dimension: order_week_year_name {
    type: string
    order_by_field: order_year_week
    sql: ${TABLE}.order_week_year_name ;;
  }

  dimension: order_year {
    type: string
    sql: ${TABLE}.order_year ;;
  }

  dimension: order_year_month {
    type: string
    sql: ${TABLE}.order_year_month ;;
  }

  dimension: order_year_quarter {
    type: string
    sql: ${TABLE}.order_year_quarter ;;
  }

  dimension: order_year_week {
    type: string
    sql: ${TABLE}.order_year_week ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      order_day_of_week_name,
      order_week_name,
      order_quarter_name,
      order_day_of_week_num_name,
      order_quarter_year_name,
      order_month_num_name,
      order_month_name,
      order_week_year_name
    ]
  }
}
