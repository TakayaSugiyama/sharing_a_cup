module FavoritesHelper
  def like?(data)
    @like = Favorite.find_by(user_id: current_user.id, post_id: data)
    if @like.present?
       true
    else 
       false
    end
  end
  
  def counts_likes(data)
      @likes = Favorite.where(post_id: data)
      @likes.count 
  end
end
