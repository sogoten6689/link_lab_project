class CreateLabs < ActiveRecord::Migration[6.1]
  def change
    create_table :labs do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :address
      t.text :image
      t.string :email
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
