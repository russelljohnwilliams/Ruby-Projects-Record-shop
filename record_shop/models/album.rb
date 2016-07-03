require( 'pg' )
require( 'pry-byebug' )
require_relative('artist')

class Album

  attr_reader( :id, :title, :format, :cat_number, :distributor, :artist_id)

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @format = options['format']
    @cat_number = options['cat_number']
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
    artist_data = run_sql( sql )
    artist = Artist.new( artist_data.first )
    return artist
  end

  def self.all(query = "")
   query = query.to_s
   sql = "SELECT * FROM albums"
   sql = sql + " WHERE name LIKE '%#{query}%'" unless query.empty?
   albums_data = run_sql( sql )
   albums = albums_data.map {|album_data| Album.new( album_data )}
   return albums
 end

 def self.find(id)
  sql = "SELECT * FROM albums WHERE id=#{id}"
  delete = run_sql(sql)
  result = Album.new(delete.first)
  return result 
end

def self.update( options )
  run_sql("UPDATE albums SET title='#{options['title']}', format='#{options['format']}', cat_number='#{options['cat_number']}', distributor='#{options['artist_id']}' WHERE id=#{options['id']}") 
end

def self.delete( id )
  run_sql( "DELETE FROM albums WHERE id=#{id}" )
end



end

