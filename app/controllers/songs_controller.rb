class SongController < ApplicationController
  

  #Create

  get '/songs/new' do 
  	@genres = Genre.all
  	erb :'/songs/new'
  end

  post '/songs' do
   
    song = Song.find_or_create_by(name: params["song"]["name"])
    song.genre_ids = params["song"]["genre_ids"] 
    song.artist = Artist.find_or_create_by(name: params["song"]["artist"])
    song.save
    
  	flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
    
  end
  
#Read

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

 
  #Update

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params["song"]["artist"])
    
    @song.update(name: params["song"]["name"], genre_ids: params["song"]["genre_ids"]) 
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end


  #Delete

  
end