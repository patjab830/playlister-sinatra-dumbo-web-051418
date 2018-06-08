class SongsController < ApplicationController

  get '/songs' do
    @items = Song.all
    @class_name = "songs"
    erb :show
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :song_form
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show_song
  end

  post '/songs' do
    # if params[song[artist]] == nil || params[song[artist]] == ""

      artist_object = Artist.find_or_create_by(name: params[:song][:artist])
      genre_object = Genre.find(name: params[:song][:genres])
      params[:song][:artist] = artist_object
      # params[:song][:genre] = genre_object
      binding.pry
      Song.create(params[:song])

      redirect '/songs'
  end

  delete '/songs/:slug/delete' do #BUGGED
    song_to_delete = Songs.find_by_slug(params[:slug])
    song_to_delete.delete
    erb :songs
  end

end
