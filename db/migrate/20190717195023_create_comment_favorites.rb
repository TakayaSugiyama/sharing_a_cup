class CreateCommentFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_favorites do |t|

      t.timestamps
    end
  end
end
