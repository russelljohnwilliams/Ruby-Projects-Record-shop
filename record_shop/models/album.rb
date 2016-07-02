require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')

class Album

  attr_reader( :id, :title, :format, :cat_number, :distributor, :artist_id)

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @format = options['format']
    @cat_number = options['cat_number']
    @distributor = ['distributor']
    @artist_id = options['artist_id'].to_i
  end

  

  

end