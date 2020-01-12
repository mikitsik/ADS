class Users::AdStatusesController < ApplicationController
  # load_and_authorize_resource

  def index
    @advertisements = Advertisement.where(user_id: params[:user_id],
                                          state: params[:status])
  end

  def show
  end
end
