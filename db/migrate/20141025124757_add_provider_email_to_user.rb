class AddProviderEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider_email, :string
  end
end
