require('pg')
require_relative('../db/sql_runner')


class Stock

  attr_reader(:id, :artist_id, :album_id, :quantity, :cost_price, :sale_price, :model_stock)

  def initialize( options )
    @id = options['id'].to_i
    @artist_id = options['book_id'].to_i
    @album_id = options['member_id'].to_i
    @quantity = options['quantity'].to_i
    @cost_price = optins['cost_price'].to_f
    @sale_price = options['sale_price'].to_f
    @model_stock = options['model_stock'].to_i
  end

end