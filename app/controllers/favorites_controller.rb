class FavoritesController < ApplicationController
  def destroy
    @favorite = Favorite.find_by(user_id: current_user,post_id: params[:id])
    if @favorite.destroy
      redirect_to posts_url
    end
  end

  def create
    @favorite = Favorite.new(user_id: current_user.id ,post_id: params[:id])
    @favorite.save
    redirect_to posts_url
  end
  
end
