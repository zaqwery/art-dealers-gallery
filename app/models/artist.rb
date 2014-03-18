class Artist < ActiveRecord::Base

  attr_accessible :bio, :name, :avatar
  #Dragonfly
  image_accessor :avatar
  has_many :images

end
