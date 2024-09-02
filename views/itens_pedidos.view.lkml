# The name of this view in Looker is "Itens Pedidos"
view: itens_pedidos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `workshop_gcp_looker.itens_pedidos` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Item Pedido ID" in Explore.

  dimension: item_pedido_id {
    type: number
    sql: ${TABLE}.item_pedido_id ;;
  }

  dimension: item_pedido_pedido_id {
    type: number
    sql: ${TABLE}.item_pedido_pedido_id ;;
  }

  dimension: item_pedido_produto_id {
    type: number
    sql: ${TABLE}.item_pedido_produto_id ;;
  }

  dimension: item_pedido_produto_preco {
    type: number
    sql: ${TABLE}.item_pedido_produto_preco ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_item_pedido_produto_preco {
    type: sum
    sql: ${item_pedido_produto_preco} ;;  }
  measure: average_item_pedido_produto_preco {
    type: average
    sql: ${item_pedido_produto_preco} ;;  }

  dimension: item_pedido_quantidade {
    type: number
    sql: ${TABLE}.item_pedido_quantidade ;;
  }

  dimension: item_pedido_subtotal {
    type: number
    sql: ${TABLE}.item_pedido_subtotal ;;
  }
  measure: count {
    type: count
  }
}
