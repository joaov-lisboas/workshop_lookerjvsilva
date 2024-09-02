# The name of this view in Looker is "Pedidos"
view: pedidos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `workshop_gcp_looker.pedidos` ;;
  drill_fields: [pedido_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: pedido_id {
    label: "ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.pedido_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cliente Cpf" in Explore.

  dimension: cliente_cpf {
    hidden: yes
    type: string
    sql: ${TABLE}.cliente_cpf ;;
  }

  dimension: pedido_data {
    hidden: yes
    label: "Data"
    type: string
    sql: ${TABLE}.pedido_data ;;
  }

  dimension: data_date {
    label: "Data"
    type: date
    sql: PARSE_TIMESTAMP('%Y-%m-%d', ${TABLE}.pedido_data) ;;
  }

  dimension: mes{
    label: "Mês"

    sql: (FORMAT_TIMESTAMP('%Y/%m',PARSE_TIMESTAMP('%Y-%m-%d',

      ${TABLE}.pedido_data)));;
  }

  dimension: ano{
    label: "Ano"

    sql: (FORMAT_TIMESTAMP('%Y', PARSE_TIMESTAMP('%Y-%m-%d',

      ${TABLE}.pedido_data)));;
  }

  dimension: pedido_forma_pagamento {
    label: "Forma de Pagamento"
    type: string
    sql: CASE WHEN ${TABLE}.pedido_forma_pagamento = 'CRED' THEN 'CREDITO'
    WHEN ${TABLE}.pedido_forma_pagamento = 'DEB' THEN 'DEBITO'
    ELSE ${TABLE}.pedido_forma_pagamento END ;;
  }

  dimension: pedido_status {
    label: "Status"
    type: string
    sql: ${TABLE}.pedido_status ;;
  }

  dimension: dif_dias_pedido {
    type: number
    sql: DATE_DIFF(current_date(), ${data_date}, DAY);;
  }

  dimension: fez_pedido_ultimo_365d {
    type: yesno
    sql: ${dif_dias_pedido} <= 365 ;;
  }

  dimension: dias_desde_pedido_tier {
    type: tier
    sql: ${dif_dias_pedido} ;;
    tiers: [180, 361, 540]
    style: integer
  }

  measure: count {
    type: count
    drill_fields: [pedido_id]
  }
}
