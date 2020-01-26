class HomeController < ApplicationController

  def index
    if params[:query]
      @advertisements = Advertisement.published.search(params[:query]).includes([:user, :images_attachments]).with_attached_images.page(params[:page])
    else
      @advertisements = Advertisement.published.includes([:user, :images_attachments]).with_attached_images.page(params[:page])
    end
  end
end
