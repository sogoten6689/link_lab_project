class CreateActionHistory < ActiveRecord::Migration[6.1]
  def change
    create_table :action_histories do |t|
      t.string :content
      t.string :action
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
