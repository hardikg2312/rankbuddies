class AddColmsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :gender, :integer, :default => 0
  end
end
