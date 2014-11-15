class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :likes, :integer, :default => 0
    add_column :users, :dislikes, :integer, :default => 0
    add_column :users, :points, :integer, :default => 0
  end
end
