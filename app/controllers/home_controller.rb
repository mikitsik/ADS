class HomeController < ApplicationController

  def index
    @advertisements = Advertisement.all
    
    render 'home/index'
  end
end
