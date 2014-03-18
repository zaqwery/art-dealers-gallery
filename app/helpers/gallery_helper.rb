module GalleryHelper
  def set_artist
    @artist = Artists.find(params[:id])
  end
end
