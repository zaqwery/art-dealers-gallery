module ImagesHelper
  #include ActsAsTaggableOn::TagsHelper
  
  def fetch_artists
    @artists = Artist.all    
  end

  # @return [Object]
  def background_artist(artist)
    @this_artist = artist
  end
  
end
