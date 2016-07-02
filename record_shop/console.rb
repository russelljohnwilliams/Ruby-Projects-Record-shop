require 'pry-byebug'

require_relative('models/album.rb')
require_relative('models/artist.rb')
require_relative('models/stock.rb')

artist1 = Artist.new({ 'name' => 'Roxy Music', 'genre' => 'Art Pop'}).save



  binding.pry
  nil