# The name of this view in Looker is "Produtos"
view: produtos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `workshop_gcp_looker.produtos` ;;
  drill_fields: [produto_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: produto_id {
    label: "ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.produto_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Produto Categoria" in Explore.

  dimension: produto_categoria {
    label: "Categoria"
    type: string
    sql: ${TABLE}.produto_categoria ;;
  }

  dimension: produto_descricao {
    label: "Descrição"
    type: string
    sql: ${TABLE}.produto_descricao ;;
  }

  dimension: produto_nome {
    label: "Nome"
    type: string
    sql: ${TABLE}.produto_nome ;;
  }

  dimension: produto_preco {
    hidden: yes
    type: number
    sql: ${TABLE}.produto_preco ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_produto_preco {
    type: sum
    sql: ${produto_preco} ;;  }
  measure: average_produto_preco {
    type: average
    sql: ${produto_preco} ;;  }
  measure: count {
    type: count
    drill_fields: [produto_id]
  }
}
