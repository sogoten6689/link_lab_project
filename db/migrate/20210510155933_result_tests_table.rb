class ResultTestsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :result_tests do |t|
      t.string :note
      t.string :image
      t.string :file
      t.string :result
      t.integer :cost
      t.integer :type
      t.string :performer
      t.integer :result_status
      t.references :user_test, null: false, foreign_key: true
      t.references :lab_test, null: false, foreign_key: true
      t.timestamps
    end
  end
end
