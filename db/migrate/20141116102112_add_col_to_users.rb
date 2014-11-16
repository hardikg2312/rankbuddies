class AddColToUsers < ActiveRecord::Migration
  def change
    add_column :users, :text_color, :string
    add_column :users, :div_color, :string
    add_column :users, :cover_photo, :string
    add_column :users, :posts_count, :integer, :default => 0
  end
end
