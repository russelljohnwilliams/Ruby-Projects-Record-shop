require 'pry-byebug'

require_relative('models/album.rb')
require_relative('models/artist.rb')
require_relative('models/stock.rb')

artist1 = Artist.new({ 'name' => 'Pixies', 'genre' => 'Alternative'}).save

album1 = Album.new({ 'title' => 'Surfa Rosa', 'format' => 'LP', 'cat_number' => 'CAD803', 'distributor' => 'PIAS', 'artist_id' => artist1.id
  }).save

stock1 = Stock.new({ 'artist_id' => artist1.id, 'album_id' => album1.id,'quantity' => 6, 'cost_price' => 2.5, 'sale_price' => 4.99, 'model_stock' => 3}).save


  binding.pry
  nil