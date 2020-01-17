class HomeController < ApplicationController

  def index
    @advertisements = Advertisement.published.page(params[:page])
  end
end
