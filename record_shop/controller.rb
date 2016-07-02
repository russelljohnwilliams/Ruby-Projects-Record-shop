require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')

require_relative( './models/album' )
require_relative( './models/artist' )
require_relative( './models/stock' )
require_relative( './controllers/albums_controller.rb' )
require_relative( './controllers/artists_controller.rb' )
require_relative( './controllers/stocks_controller.rb' )

