class AddPostForToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_for, :integer
  end
end
