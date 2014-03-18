class UpdateImagesTable < ActiveRecord::Migration
  
  change_table :images do |t|
    t.remove :original_path
    #t.remove :dimentions
    t.string :dimensions
    t.integer :year
    t.string :technique
    t.integer :artist_id
  end
  
end
