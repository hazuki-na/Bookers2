class AddProfileImageIdToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :profile_image_id, :string, default: "default.jpg"
  end
end
