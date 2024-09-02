# The name of this view in Looker is "Pedidos"
view: pedidos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `workshop_gcp_looker.pedidos` ;;
  drill_fields: [pedido_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: pedido_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.pedido_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cliente Cpf" in Explore.

  dimension: cliente_cpf {
    type: string
    sql: ${TABLE}.cliente_cpf ;;
  }

  dimension: pedido_data {
    type: string
    sql: ${TABLE}.pedido_data ;;
  }

  dimension: pedido_forma_pagamento {
    type: string
    sql: ${TABLE}.pedido_forma_pagamento ;;
  }

  dimension: pedido_status {
    type: string
    sql: ${TABLE}.pedido_status ;;
  }
  measure: count {
    type: count
    drill_fields: [pedido_id]
  }
}
