
#NEW
get '/artists/new' do
  erb( :'artists/new' )
end

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

