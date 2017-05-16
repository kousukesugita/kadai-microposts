class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def index
    @favorite = Favorite.all.page(params[:page])
  end

  def show
    @user = User.find(params[:user_id])
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = @user.favorites.all.page(params[:page])
  end

  def create
    # params[:micropost_id]
    # と current_user.id を使って登録する
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.add_favorite(@micropost)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to root_path
  end

  def destroy
     @micropost = Micropost.find(params[:micropost_id])
     @favorite = current_user.remove_favorite(@micropost)
     flash[:success] = 'お気に入りから削除しました。'
     redirect_to root_path
  end
end
