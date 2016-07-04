require 'pry-byebug'

require_relative('models/album')
require_relative('models/artist')
require_relative('models/stock')



artist1 = Artist.new({ 'name' => 'Pixies', 'genre' => 'Alternative'})
artist1.save();
artist2 = Artist.new({ 'name' => 'The Smiths', 'genre' => 'Indie'})
artist2.save();
artist3 = Artist.new({ 'name' => 'Sonic Youth', 'genre' => 'Rock'})
artist3.save();
artist4 = Artist.new({ 'name' => 'Beck', 'genre' => 'Rock'})
artist4.save();

album1 = Album.new({ 'title' => 'Surfa Rosa', 'format' => 'LP', 'cat_number' => 'CAD803', 'distributor' => 'PIAS', 'artist_id' => artist1.id
  })
album1.save();

album2 = Album.new({ 'title' => 'Sister', 'format' => 'CD', 'cat_number' => 'BF001', 'distributor' => 'Blast First', 'artist_id' => artist3.id
  })
album2.save();

album3 = Album.new({ 'title' => 'Odelay', 'format' => 'CD', 'cat_number' => 'GEF001', 'distributor' => 'UNI', 'artist_id' => artist4.id
  })
album3.save();

album4 = Album.new({ 'title' => 'Queen is Dead', 'format' => 'LP', 'cat_number' => 'RTRAT100', 'distributor' => 'Pinnacle', 'artist_id' => artist2.id
  })
album4.save();

stock1 = Stock.new({ 'artist_id' => artist1.id, 'album_id' => album1.id,'quantity' => '5', 'cost_price' => 2.99, 'sale_price' => 4.99, 'model_stock' => '3'})
stock1.save();

stock2 = Stock.new({ 'artist_id' => artist3.id, 'album_id' => album2.id,'quantity' => '1', 'cost_price' => 2.50, 'sale_price' => 7.99, 'model_stock' => '1'})
stock1.save();


  binding.pry
  nil