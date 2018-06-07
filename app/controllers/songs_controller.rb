class SongsController < ApplicationController

  get '/songs' do
    @items = Song.all
    @class_name = "songs"
    erb :show
  end

  get '/songs/new' do
    erb :song_form
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show_song
  end


end
