class FixCommentFavoriteAgain < ActiveRecord::Migration[5.2]
  def change
    add_reference :comment_favorites, :user,index: true
  end
end
