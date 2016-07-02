require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( '../models/album' )

class Artist

  attr_reader( :id, :name, :genre )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO artists (name, genre) VALUES ('#{@name}', '#{@genre}' ) RETURNING *"
    artist = run(sql).first
    result = Artist.new( artist )
    return result
  end

end