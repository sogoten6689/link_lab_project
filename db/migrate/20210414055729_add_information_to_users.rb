class AddInformationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postion, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :image, :string
    add_column :users, :lab_id, :integer
  end
end
