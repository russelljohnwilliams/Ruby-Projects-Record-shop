require 'pry-byebug'

require_relative('models/album')
require_relative('models/artist')
require_relative('models/stock')



artist1 = Artist.new({ 'name' => 'Pixies', 'genre' => 'Alternative'})
artist1.save();

album1 = Album.new({ 'title' => 'Surfa Rosa', 'format' => 'LP', 'cat_number' => 'CAD803', 'distributor' => 'PIAS', 'artist_id' => artist1.id
  })
album1.save();

stock1 = Stock.new({ 'artist_id' => artist1.id, 'album_id' => album1.id,'quantity' => 6, 'cost_price' => 2, 'sale_price' => 4, 'model_stock' => 3})
stock1.save();


  binding.pry
  nil