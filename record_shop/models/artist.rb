
require( 'pg' )
require_relative( '../db/sql_runner' )

class Artist

  attr_reader( :id, :name, :genre )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO artists (name, genre) VALUES ('#{@name}', '#{@genre}' ) RETURNING *"
    album_data = run_sql(sql)
    @id = album_data.first['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM artists"
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
    run_sql(  
      "UPDATE artists SET 
      name='#{options['name']}'
      WHERE id=#{options['id']}"
      ) 
  end


  def self.delete( id )
    run_sql( "DELETE FROM artists WHERE id=#{id}" )
  end



end