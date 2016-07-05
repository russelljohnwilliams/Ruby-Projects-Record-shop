#SEARCH

get '/albums' do
  query = params[:search]
  @albums = Album.all(query)
  erb ( :'albums/index' )
end

#NEW 
#ALBUMS / NEW

get '/albums/new' do
  @artists = Artist.all
  erb( :'albums/new' )
end

#INDEX
#ALBUMS / INDEX

get '/albums' do
  @album = Album.all
  @artist = Artist.all
  erb :'albums/index'
end

#CREATE 
#/ALBUMS / INDEX

post '/albums' do
 @album = Album.new( params )
 @album.save()
 redirect to('/albums')
end

#SHOW
#/ALBUMS / :ID

get '/albums/:id' do
  @album = Album.find( params[:id] )
  erb( :'albums/show' )
end

#EDIT
#/ALBUMS / :ID / EDIT 

get '/albums/:id/edit' do
  @album = Album.find( params[:id] )
  @artists = Artist.all()
  erb( :'albums/edit' )
end

#UPDATE
#/ ALBUMS / INDEX

put '/albums/:id' do
 @album = Album.update( params )
 redirect to( "/albums" )
end

#DELETE
#/ ALBUMS / INDEX

post '/albums/:id/delete' do
  Album.delete(params[:id])
  redirect to('/albums')
end



