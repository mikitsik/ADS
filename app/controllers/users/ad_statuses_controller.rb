class Users::AdStatusesController < ApplicationController

  def index
    @advertisements = Advertisement.where(user_id: params[:user_id],
                                          state: params[:status])
  end

  def update
    advertisement = Advertisement.find(params[:id])
    advertisement.update(state: params[:status])

    redirect_to users_ad_statuses_path(user_id: params[:user_id], status: params[:status])
  end
end
