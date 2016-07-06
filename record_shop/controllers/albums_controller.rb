#SEARCH
#INDEX

get '/albums' do
  query = params[:search]
  @albums = Album.all(query)
  erb ( :'albums/index' )
end

#NEW 

get '/albums/new' do
  @artists = Artist.all
  erb( :'albums/new' )
end

#CREATE 

post '/albums' do
 @album = Album.new( params )
 @album.save()
 redirect to('/albums')
end

#SHOW

get '/albums/:id' do
  @album = Album.find( params[:id] )
  erb( :'albums/show' )
end

#EDIT

get '/albums/:id/edit' do
  @album = Album.find( params[:id] )
  @artists = Artist.all()
  erb( :'albums/edit' )
end

#UPDATE

put '/albums/:id' do
 @album = Album.update( params )
 redirect to( "/albums" )
end

#DELETE

post '/albums/:id/delete' do
  Album.delete(params[:id])
  redirect to('/albums')
end



