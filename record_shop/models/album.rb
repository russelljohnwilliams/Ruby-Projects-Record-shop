require( 'pg' )
require( 'pry-byebug' )
require_relative('artist')

class Album

  attr_reader( :id, :title, :format, :cat_number, :distributor, :artist_id)

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title'].capitalize
    @format = options['format'].upcase
    @cat_number = options['cat_number'].upcase
    @distributor = options['distributor']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, format, cat_number, distributor, artist_id) VALUES ('#{@title}', '#{@format}', '#{@cat_number}', '#{@distributor}', '#{@artist_id}') RETURNING *"
    album = run_sql(sql)
    @id = album.first['id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{ @artist_id }"
    artists = run_sql( sql )
    artist = Artist.new( artists.first )
    return artist
  end

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM albums"
    sql = sql + " WHERE title LIKE '%#{query}%'" unless query.empty?
    albums = run_sql( sql )
    result = albums.map { |album| Album.new( album ) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id=#{id}"
    delete = run_sql(sql)
    result = Album.new(delete.first)
    return result 
  end

  def self.update( options )
    run_sql(
      "UPDATE albums SET title='#{options['title']}', format='#{options['format']}', cat_number='#{options['cat_number']}', distributor='#{options['distributor']}' WHERE id=#{options['id']}"
      ) 
  end

  def self.delete( id )
    run_sql( "DELETE FROM albums WHERE id=#{id}" )
  end

# def self.map_items(sql)
#   albums = run(sql)
#   result = albums.map { |album| Artist.new( album ) }
#   return result
# end

# def self.map_item(sql)
#   result = Album.map_items(sql)
#   return result.first
# end

end

