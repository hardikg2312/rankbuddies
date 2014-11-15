class CreateLikings < ActiveRecord::Migration
  def change
    create_table :likings do |t|
      t.integer :user_id
      t.integer :like_id
      t.string :status

      t.timestamps
    end
  end
end
