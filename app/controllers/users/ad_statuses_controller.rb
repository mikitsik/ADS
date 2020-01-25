class Users::AdStatusesController < ApplicationController
  
  def index
    @advertisements = Advertisement.where(user_id: params[:user_id],
                                          state: params[:status]).includes([:images_attachments]).with_attached_images.page(params[:page])
  end

  def update
    advertisement = Advertisement.find(params[:id])
    advertisement.update(state: params[:status])

    redirect_to users_ad_statuses_path(user_id: params[:user_id], status: params[:status])
  end
end
