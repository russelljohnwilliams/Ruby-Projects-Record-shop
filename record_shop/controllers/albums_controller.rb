#SEARCH

get '/albums' do
  query = params[:search]
  @albums = Album.all(query)
  erb ( :'albums/index' )
end

#NEW 
#ALBUMS / NEW
#ERB - albums/new

get '/albums/new' do
  @artists = Artist.all
  erb( :'albums/new' )
end

#INDEX
#ALBUMS / INDEX
#ERB - albums/index
#------------------------ self.all

get '/albums' do
  @album = Album.all
  erb :'albums/index'
end


#CREATE 
#/ALBUMS / INDEX
#ERB - albums/
#------------------------ self.save

post '/albums' do
 @album = Album.new( params )
 @album.save()
 redirect to('/albums')
end


#SHOW
#/ALBUMS / :ID
#ERB - albums/id/edit
#------------------------ self.find

get '/albums/:id' do
  @album = Album.find( params[:id] )
  erb( :'albums/show' )
end


#EDIT
#/ALBUMS / :ID / EDIT 
#ERB - albums/edit
#------------------------ self.find

get '/albums/:id/edit' do
  @album = Album.find( params[:id] )
  @artists = Artist.all()
  erb( :'albums/edit' )
end


#UPDATE
#/ ALBUMS / INDEX
#ERB - albums/
#------------------------ self.update

put '/albums/:id' do
 @album = Album.update( params )
 redirect to( "/albums" )
end


#DELETE
#/ ALBUMS / INDEX
#ERB - albums/
#------------------------ self.delete

post '/albums/:id/delete' do
  Album.delete(params[:id])
  redirect to('/albums')
end



