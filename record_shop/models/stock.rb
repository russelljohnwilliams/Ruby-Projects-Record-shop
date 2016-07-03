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



    def book()
      sql = "SELECT * FROM books WHERE id = #{@book_id}"
      return Book.map_item(sql)
    end

    def member()
      sql = "SELECT * FROM members WHERE id = #{@book_id}"
      return Member.map_item(sql)
    end

    def self.all()
      sql = "SELECT * FROM rentals"
      return Rental.map_items(sql)
    end

    def self.map_items(sql)
      rental = run(sql)
      result = rental.map { |product| Rental.new( product ) }
      return result
    end

    def self.map_item(sql)
      result = Rental.map_items(sql)
      return result.first
    end

  end
