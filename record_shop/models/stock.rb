require('pg')
require('pry-byebug')
require_relative('../db/sql_runner')


class Stock

  attr_reader(:id, :artist_id, :album_id, :quantity, :cost_price, :sale_price, :model_stock)

  def initialize( options )
    @id = options['id'].to_i
    @artist_id = options['artist_id'].to_i
    @album_id = options['album_id'].to_i
    @quantity = options['quantity'].to_i
    @cost_price = options['cost_price'].to_f
    @sale_price = options['sale_price'].to_f
    @model_stock = options['model_stock'].to_i
  end

  def save()
    sql = "INSERT INTO stocks (artist_id, album_id, 
    quantity, cost_price, sale_price, model_stock) VALUES ('#{@artist_id}', '#{@album_id}', '#{@quantity}', '#{@cost_price}', '#{@sale_price}', '#{@model_stock}' ) RETURNING *"
    result = run_sql(sql)
    @id = result.first['id']
  end

  def stock_level()
    if  model_stock > quantity
      result = "Order More!"
    elsif model_stock < quantity
      result = "Plenty"
    elsif model_stock == quantity
      result = "Running Low"
    end
    return result 
  end

  def self.sum_of_stock
    stocks = self.all()
    result = stocks.inject(0) { |sum, stock| sum + stock.sale_price }
    return result.round(2)
  end

  def self.sum_of_cost_price
    total = self.all()
    result = total.inject(0) { |sum, stock| sum + stock.cost_price }
    return result.round(2)
  end

  def self.profit
    stocks = self.sum_of_stock
    cost = self.sum_of_cost_price
    result = stocks - cost
    return result.round(2)
  end

  def self.quantity
    quantity = self.all()
    result = quantity.inject(0) { |sum, stock| sum + stock.quantity }
    return result
  end

  def mark_up()
    result = sale_price - cost_price
    return result
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    artists = run_sql( sql )
    artist = Artist.new( artists.first )
    return artist
  end

  def album()
    sql = "SELECT * FROM albums WHERE id = #{@album_id}"
    albums = run_sql( sql )
    album = Album.new( albums.first )
    return album
  end

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM stocks"
    sql = sql + " WHERE quantity = '%#{query}%'" unless query.empty?
    product = run_sql( sql )
    result = product.map { |stock| Stock.new( stock ) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM stocks WHERE id=#{id}"
    delete = run_sql(sql)
    result = Stock.new(delete.first)
    return result 
  end

  def self.update( options )
    sql = (  
      "UPDATE stocks SET quantity='#{options['quantity']}', cost_price='#{options['cost_price']}', sale_price='#{options['sale_price']}', model_stock='#{options['model_stock']}' WHERE id=#{options['id']}"
      ) 
    run_sql(sql)
  end

  def self.map_items(sql)
    stock = run(sql)
    result = stock.map { |product| Stock.new( product ) }
    return result
  end

  def self.map_item(sql)
    result = Stock.map_items(sql)
    return result.first
  end

end


