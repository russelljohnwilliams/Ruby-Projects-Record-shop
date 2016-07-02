
#NEW
get '/artists/new' do
  erb( :'artists/new' )
end


#CREATE
post '/artists' do
 @artist = Artist.new( params )
 @artist.save()
 redirect to('/artists')
end