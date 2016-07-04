#NEW

get '/stock/new' do
  erb( :'stock/new' )
end

#INDEX

#------------------------<<<<<<<<<<<____________________self.all
get '/stock' do
  @stock = Stock.all
  erb :'stock/index'
end

#CREATE
#------------------------<<<<<<<<<<<____________________.save
post '/stock' do
 @stock = Stock.new( params )
 @stock.save()
 redirect to('/stock')
end

#SHOW
#------------------------<<<<<<<<<<<____________________self.find

get '/stock/:id' do
  @stock = Stock.find( params[:id] )
  erb( :'stock/show' )
end

#EDIT
#------------------------<<<<<<<<<<<____________________self.find

get '/stock/:id/edit' do
  @stock = Stock.find( params[:id] )
  erb( :'stock/edit' )
end

#UPDATE
#------------------------<<<<<<<<<<<____________________self.update

put '/stock/:id' do
 @stock = Stock.update( params )
 redirect to( "/stock" )
end

#DELETE
#------------------------<<<<<<<<<<<____________________self.delete

post '/stock/:id/delete' do
  Stock.delete(params[:id])
  redirect to('/stock')
end


