class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true
      t.string :title
      t.text :comment
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
