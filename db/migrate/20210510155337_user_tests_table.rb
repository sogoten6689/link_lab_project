class UserTestsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tests do |t|
      t.string :note
      t.string :image
      t.string :address
      t.string :phone
      t.string :reason
      t.integer :total
      t.integer :type
      t.integer :test_status
      t.references :doctor, null: true, foreign_key: {to_table: :users}
      t.references :user, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
