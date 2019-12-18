require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('pry')
also_reload('lib/**/*.rb')


get('/') do
  @stages = Stage.all
  erb(:stages)
end

get('/create_stage') do
  erb(:create_stage)
end

post('/stages_form') do
  name = params[:stage_name]
  stage = Stage.new(name, nil)
  stage.save()
  @stages = Stage.all()
  erb(:stages)
end

get('/stage/:id') do
  @stage = Stage.find(params[:id].to_i)
  erb(:stage)
end

get('/stages/:id/artist')do
  @stage = Stage.find(params[:id].to_i)
  erb(:artist)
end

post('/stages/:id/artists')do
  @stage = Stage.find(params[:id].to_i)
  name = params[:artist_name]
  genre = params[:artist_genre]
  artist = Artist.new(name, genre, nil)
  @stage.add_artist(artist)
  erb(:artists)
end

patch('/stages/:id/artists/:artist_id') do
  @stage = Stage.find(params[:id].to_i())
  artist = @stage.artists[(params[:artist_id].to_i)]
  artist.delete
end
