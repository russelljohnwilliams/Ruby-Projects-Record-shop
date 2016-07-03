require('pg')
require_relative('../db/sql_runner')


class Stock

  attr_reader(:id, :artist_id, :album_id, :quantity, :cost_price, :sale_price, :model_stock)

  def initialize( options )
    @id = options['id'].to_i
    @artist_id = options['artist_id'].to_i
    @album_id = options['album_id'].to_i
    @quantity = options['quantity'].to_i
    @cost_price = options['cost_price'].to_i# must change to float
    @sale_price = options['sale_price'].to_i#must change to float
    @model_stock = options['model_stock'].to_i
  end

  def save()
    sql = "INSERT INTO stocks (artist_id, album_id, 
    quantity, cost_price, sale_price, model_stock) VALUES ('#{@artist_id}', '#{@album_id}', '#{@quantity}', '#{@cost_price}', '#{@sale_price}', '#{@model_stock}' ) RETURNING *"
    result = run_sql(sql)
    @id = result.first['id'].to_i
  end


  require('pg')
  require_relative('../db/sql_runner')



    

  end
