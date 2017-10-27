require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get 'songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    if params[:slug] != 'new'
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show'
    else
      @genres = Genre.all
      @artists = Artist.all
      erb :'songs/new'
    end
  end

  post '/songs' do
    @song = Song.create(name: params[:Name])
    @song.save
    Artist.all.select {|a| a.name == params["Artist Name"]}
    if _.empty?
      @artist = Artist.create(name: params["Artist Name"])
      @artist.save
    end
      redirect "songs/#{@song.slug}"
  end

end
