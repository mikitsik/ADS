class HomeController < ApplicationController

  def index
    @advertisements = Advertisement.all
  end
end
