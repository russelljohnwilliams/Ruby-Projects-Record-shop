#SEARCH

get '/artists' do
  query = params[:search]
  @artists = Artist.all(query)
  erb ( :'artists/index' )
end

#NEW

get '/artists/new' do
  erb( :'artists/new' )
end

#INDEX

#------------------------.all
get '/artists' do
  @artist = Artist.all
  erb :'artists/index'
end

#CREATE
#------------------------.save
post '/artists' do
 @artist = Artist.new( params )
 @artist.save()
 redirect to('/artists')
end

#SHOW
#------------------------.find

get '/artists/:id' do
  @artist = Artist.find( params[:id] )
  erb( :'artists/show' )
end

#EDIT
#------------------------.find

get '/artists/:id/edit' do
  @artist = Artist.find( params[:id] )
  erb( :'artists/edit' )
end

#UPDATE
#------------------------.update

put '/artists/:id' do
 @artist = Artist.update( params )
 redirect to( "/artists/#{params[:id]}" )
end

#DELETE
#------------------------ .delete

post '/artists/:id/delete' do
  Artist.delete(params[:id])
  redirect to('/artists')
end