class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :position
      t.string :phone
      t.string :address
      t.text :image
      t.references :user, null: true, foreign_key: true
      t.references :lab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
