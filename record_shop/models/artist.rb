  require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative('album')

class Artist

  attr_reader( :id, :name, :genre )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name'].capitalize
    @genre = options['genre'].capitalize
  end

  def save()
    sql = "INSERT INTO artists (name, genre) VALUES ('#{@name}', '#{@genre}' ) RETURNING *"
    album_data = run_sql(sql)
    @id = album_data.first['id'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    albums_data = run_sql( sql )
    albums = albums_data.map { |album_data| Album.new(album_data) }
    return albums
  end


 def self.all(query = "")
   query = query.to_s
   sql = "SELECT * FROM artists"
   sql = sql + " WHERE genre || name LIKE '%#{query}%'" unless query.empty?
   artists = run_sql( sql )
   result = artists.map { |artist| Artist.new( artist ) }
   return result
 end


  def self.find(id)
    sql = "SELECT * FROM artists WHERE id=#{id}"
    delete = run_sql(sql)
    result = Artist.new(delete.first)
    return result 
  end

  def self.update( options )
    sql = (  
      "UPDATE artists SET 
      name='#{options['name']}', genre='#{options['genre']}'
      WHERE id=#{options['id']}"
      ) 
    run_sql(sql)
  end

  def self.delete( id )
    run_sql( "DELETE FROM artists WHERE id=#{id}" )
  end

  # def self.map_items(sql)
  #   artists = run(sql)
  #   result = artists.map { |artist| Artist.new( artist ) }
  #   return result
  # end

  # def self.map_item(sql)
  #   result = Artist.map_items(sql)
  #   return result.first
  # end



end