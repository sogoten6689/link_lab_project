class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.string :full_content
      t.string :short_content
      t.references :user, null: false, foreign_key: true
      t.references :lab, null: true, foreign_key: true

      t.timestamps
    end
  end
end
