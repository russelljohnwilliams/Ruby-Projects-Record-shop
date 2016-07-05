#NEW

get '/stock/new' do
  @albums = Album.all
  @artists = Artist.all
  erb( :'stock/new' )
end

#INDEX

get '/stock' do
  @stock = Stock.all
  erb :'stock/index'
end

#CREATE

post '/stock' do
 @stock = Stock.new( params )
 @stock.save()
 redirect to('/stock')
end

#SHOW

get '/stock/:id' do
  @stock = Stock.find( params[:id] )
  erb( :'stock/show' )
end

#EDIT

get '/stock/:id/edit' do
  @stock = Stock.find( params[:id] )
  erb( :'stock/edit' )
end

#UPDATE

put '/stock/:id' do
 @stock = Stock.update( params )
 redirect to( "/stock" )
end

#DELETE

post '/stock/:id/delete' do
  Stock.delete(params[:id])
  redirect to('/stock')
end


