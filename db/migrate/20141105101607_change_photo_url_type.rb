class ChangePhotoUrlType < ActiveRecord::Migration
  def up
    change_column :posts, :photo_url, :string
  end

  def down
    change_column :posts, :photo_url, :text
  end
end
