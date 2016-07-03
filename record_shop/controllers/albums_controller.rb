#NEW

get '/albums/new' do
  erb( :'albums/new' )
end

#INDEX

#------------------------<<<<<<<<<<<____________________self.all
get '/albums' do
  @album = Album.all
  erb :'albums/index'
end

#CREATE
#------------------------<<<<<<<<<<<____________________.save
post '/albums' do
 @album = Album.new( params )
 @album.save()
 redirect to('/albums')
end

#SHOW
#------------------------<<<<<<<<<<<____________________self.find

get '/albums/:id' do
  @album = Album.find( params[:id] )
  erb( :'albums/show' )
end

#EDIT
#------------------------<<<<<<<<<<<____________________self.find

get '/albums/:id/edit' do
  @album = Album.find( params[:id] )
  erb( :'albums/edit' )
end

#UPDATE
#------------------------<<<<<<<<<<<____________________self.update

put '/albums/:id' do
 @album = Album.update( params )
 redirect to( "/albums/#{params[:id]}" )
end

#DELETE
#------------------------<<<<<<<<<<<____________________self.delete

post '/albums/:id/delete' do
  Album.delete(params[:id])
  redirect to('/albums')
end