class CreateLabTest < ActiveRecord::Migration[6.1]
  def change
    create_table :lab_tests do |t|
      t.boolean :active
      t.boolean :is_lab_price
      t.integer :lab_price
      t.integer :lab_tax
      t.references :raw_test, null: false, foreign_key: true
      t.references :lab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
