class CreateTestTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :test_types do |t|
      t.string :vi_name
      t.string :en_name

      t.timestamps
    end
  end
end
