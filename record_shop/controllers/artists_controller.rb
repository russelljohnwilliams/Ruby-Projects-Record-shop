#SEARCH

get '/artists/search' do
  query = params[:search]
  @artists = Artist.search(query)
  erb ( :'artist/search' )
end

#NEW

get '/artists/new' do
  erb( :'artists/new' )
end

#INDEX

get '/artists' do
  @artist = Artist.all
  erb :'artists/index'
end

#CREATE

post '/artists' do
 @artist = Artist.new( params )
 @artist.save()
 redirect to('/artists')
end

#SHOW

get '/artists/:id' do
  @artist = Artist.find( params[:id] )
  erb( :'artists/show' )
end

#EDIT

get '/artists/:id/edit' do
  @artist = Artist.find( params[:id] )
  erb( :'artists/edit' )
end

#UPDATE

put '/artists/:id' do
 @artist = Artist.update( params )
 redirect to( "/artists/#{params[:id]}" )
end

#DELETE

post '/artists/:id/delete' do
  Artist.delete(params[:id])
  redirect to('/artists')
end