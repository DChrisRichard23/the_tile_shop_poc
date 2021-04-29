view: button_table {
  derived_table: {
    sql: SELECT
        'Back to Main Dashboard' AS back_button
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: back_button {
    type: string
    sql: ${TABLE}.back_button ;;
    html: <a href="/dashboards-next/96">{{ value }}</a> ;;
  }

  set: detail {
    fields: [back_button]
  }
}
