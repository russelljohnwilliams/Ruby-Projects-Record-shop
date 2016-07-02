
#NEW

get '/artists/new' do
  erb( :'artists/new' )
end

#INDEX

#------------------------<<<<<<<<<<<____________________self.all
get '/artists' do
  @artist = Artist.all
  erb :'artists/index'
end

#CREATE
#------------------------<<<<<<<<<<<____________________.save
post '/artists' do
 @artist = Artist.new( params )
 @artist.save()
 redirect to('/artists')
end

#SHOW
#------------------------<<<<<<<<<<<____________________self.find

get '/artists/:id' do
  @artist = Artist.find( params[:id] )
  erb( :'artists/show' )
end

#EDIT
#------------------------<<<<<<<<<<<____________________self.find

get '/artists/:id/edit' do
  @artist = Artist.find( params[:id] )
  erb( :'artists/edit' )
end

#UPDATE
#------------------------<<<<<<<<<<<____________________self.update

put '/artists/:id' do
 @artist = Artist.update( params )
 redirect to( "/artists/#{params[:id]}" )
end

#DELETE
#------------------------<<<<<<<<<<<____________________self.delete

post '/artists/:id/delete' do
  Artist.delete(params[:id])
  redirect to('/artists')
end