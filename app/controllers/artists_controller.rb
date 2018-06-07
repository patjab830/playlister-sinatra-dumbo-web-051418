class ArtistsController < ApplicationController

  get '/artists' do
    @items = Artist.all
    @class_name = "artists"
    erb :show
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :show_artist
  end

end
