class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite_for(micropost)
    flash[:success] = 'ユーザをフォローしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite_for(micropost)
    flash[:success] = 'ユーザのフォローを解除しました。'
    redirect_back(fallback_location: root_url)
  end
  
end
