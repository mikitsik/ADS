class HomeController < ApplicationController

  def index
    @advertisements = Advertisement.published.includes([:user, :images_attachments]).with_attached_images.page(params[:page])
  end
end
