class AddAvatarToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :avatar_uid, :string
  end
end
