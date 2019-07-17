class FixCommentFavorite < ActiveRecord::Migration[5.2]
  def change
    remove_reference :comment_favorites, :post
    add_reference :comment_favorites, :comment,index: true
  end
end
