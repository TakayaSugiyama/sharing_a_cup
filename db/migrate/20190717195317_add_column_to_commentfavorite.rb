class AddColumnToCommentfavorite < ActiveRecord::Migration[5.2]
  def change
   add_reference :comment_favorites, :post, index: true
   add_reference :comment_favorites, :user, index: true
  end
end
