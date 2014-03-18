class Image < ActiveRecord::Base
  attr_accessible :picture, :name, :dimensions, :year, :technique, :artist_id, :tag_list
  belongs_to :artist
  
  #Dragonfly
  image_accessor :picture
  
  #Tags
  acts_as_taggable



end
