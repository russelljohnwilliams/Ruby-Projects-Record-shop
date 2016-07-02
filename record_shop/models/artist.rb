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

  end