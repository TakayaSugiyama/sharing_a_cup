class FixCommentFavorite < ActiveRecord::Migration[5.2]
  def change
    
    add_reference :comment_favorites, :comment,index: true
  end
end
