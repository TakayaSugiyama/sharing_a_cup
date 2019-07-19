class AddPostColumnToCommentfavorite < ActiveRecord::Migration[5.2]
  def change
    add_reference :comment_favorites, :post, index: true
  end
end
