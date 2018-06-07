class GenresController < ApplicationController

   get '/genres' do
     @items = Genre.all
     @class_name = "genres"
     erb :show
   end

   get '/genres/:slug' do
     @genre = Genre.find_by_slug(params[:slug])
     @artists = @genre.artists
     erb :show_genre
   end
end
