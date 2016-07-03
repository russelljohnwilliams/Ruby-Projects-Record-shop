require('sinatra' )
require('sinatra/contrib/all' )
require('pry-byebug')

require_relative( 'models/album' )
require_relative( 'models/artist' )
require_relative( 'models/stock' )
require_relative( 'controllers/albums_controller' )
require_relative( 'controllers/artists_controller' )
require_relative( 'controllers/stocks_controller' )

get( '/index' ) do 
  @artists = Artist.all()
  @albums = Album.all()
  erb( :index )
end 