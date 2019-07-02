class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :product_name
      t.string :title
      t.string :price
      t.text :review
      t.references :user

      t.timestamps
    end
  end
end
