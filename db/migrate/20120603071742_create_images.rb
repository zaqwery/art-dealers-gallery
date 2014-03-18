class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :picture_uid
      t.string :name
      t.string :original_path
      t.timestamps
    end
  end
end
