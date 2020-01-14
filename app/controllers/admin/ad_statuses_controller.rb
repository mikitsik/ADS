class Admin::AdStatusesController < ApplicationController
  
  def index
    @advertisements = Advertisement.where(state: :new)
  end

  def update
    advertisement = Advertisement.find(params[:id])
    advertisement.update(state: params[:status])

    redirect_to admin_ad_statuses_path
  end
end
