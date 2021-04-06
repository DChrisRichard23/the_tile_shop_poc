view: dim_ship_date {
  sql_table_name: `mw-data-analytics-sandbox.the_tile_shop_poc.dim_ship_date`
    ;;

  dimension_group: ship {
    type: time
    timeframes: [
      date
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ship_date ;;
  }

  dimension: ship_day_of_week_name {
    type: string
    order_by_field: ship_day_of_week_num
    sql: ${TABLE}.ship_day_of_week_name ;;
  }

  dimension: ship_day_of_week_num {
    type: number
    sql: ${TABLE}.ship_day_of_week_num ;;
  }

  dimension: ship_day_of_week_num_name {
    type: string
    order_by_field: ship_day_of_week_num
    sql: ${TABLE}.ship_day_of_week_num_name ;;
  }

  dimension: ship_day_of_week_short {
    type: string
    order_by_field: ship_day_of_week_num
    sql: ${TABLE}.ship_day_of_week_short ;;
  }

  dimension: ship_full_date_description {
    type: string
    order_by_field: ship_date
    sql: ${TABLE}.ship_full_date_description ;;
  }

  dimension: ship_month_name {
    type: string
    order_by_field: ship_month_num
    sql: ${TABLE}.ship_month_name ;;
  }

  dimension: ship_month_name_short {
    type: string
    order_by_field: ship_month_num
    sql: ${TABLE}.ship_month_name_short ;;
  }

  dimension: ship_month_num {
    type: number
    sql: ${TABLE}.ship_month_num ;;
  }

  dimension: ship_month_num_name {
    type: string
    order_by_field: ship_year_month
    sql: ${TABLE}.ship_month_num_name ;;
  }

  dimension: ship_month_year {
    type: string
    order_by_field: ship_year_month
    sql: ${TABLE}.ship_month_year ;;
  }

  dimension: ship_quarter_name {
    type: string
    order_by_field: ship_quarter_num
    sql: ${TABLE}.ship_quarter_name ;;
  }

  dimension: ship_quarter_num {
    type: number
    sql: ${TABLE}.ship_quarter_num ;;
  }

  dimension: ship_quarter_year_name {
    type: string
    order_by_field: ship_year_quarter
    sql: ${TABLE}.ship_quarter_year_name ;;
  }

  dimension: ship_week_name {
    type: string
    order_by_field: ship_week_number
    sql: ${TABLE}.ship_week_name ;;
  }

  dimension: ship_week_number {
    type: number
    sql: ${TABLE}.ship_week_number ;;
  }

  dimension: ship_week_year_name {
    type: string
    order_by_field: ship_year_week
    sql: ${TABLE}.ship_week_year_name ;;
  }

  dimension: ship_year {
    type: number
    sql: ${TABLE}.ship_year ;;
  }

  dimension: ship_year_month {
    type: string
    sql: ${TABLE}.ship_year_month ;;
  }

  dimension: ship_year_quarter {
    type: string
    sql: ${TABLE}.ship_year_quarter ;;
  }

  dimension: ship_year_week {
    type: string
    sql: ${TABLE}.ship_year_week ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      ship_month_name,
      ship_month_num_name,
      ship_quarter_name,
      ship_day_of_week_num_name,
      ship_week_year_name,
      ship_quarter_year_name,
      ship_day_of_week_name,
      ship_week_name
    ]
  }
}
