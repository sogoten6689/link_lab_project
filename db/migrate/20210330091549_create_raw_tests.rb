class CreateRawTests < ActiveRecord::Migration[6.1]
  def change
    create_table :raw_tests do |t|
      t.string :name
      t.string :note
      t.integer :cost
      t.integer :tax
      t.references :test_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
