class ArtistController < ApplicationController
	

	
  #Create

  #Read

  get '/artists' do
  	@artists = Artist.all
  	erb :'/artists/index'
  end

  get '/artists/:slug' do  #will be in it's own controller
  	@artist = Artist.find_by_slug(params[:slug])
  	erb :'/artists/show'
  end

  #Update

  #Destroy


	

end