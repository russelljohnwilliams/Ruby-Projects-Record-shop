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
    @cost_price = options['cost_price']
    @sale_price = options['sale_price']
    @model_stock = options['model_stock'].to_i
  end

  def save()

    sql = "INSERT INTO stocks (artist_id, album_id, 
    quantity, cost_price, sale_price, model_stock) VALUES ('#{@artist_id}', '#{@album_id}', '#{@quantity}', '#{@cost_price}', '#{@sale_price}', '#{@model_stock}' ) RETURNING *"
    result = run_sql(sql)
    @id = result.first['id']
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


  def self.all()
    sql = "SELECT * FROM stocks"
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


# "SELECT artists.name, artists.genre, albums.title, albums.format, stocks.quantity, stocks.cost_price, stocks.sale_price, stocks.model_stock  FROM artists INNER JOIN stocks ON stocks.artist_id = artists.id INNER JOIN albums ON stocks.album_id = albums.id;"