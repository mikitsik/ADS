class Users::AdImagesController < ApplicationController
  def destroy
    ActiveStorage::Attachment.find(params[:id]).purge
    redirect_to users_ad_statuses_path(user_id: current_user, status: 'draft')
  end
end
