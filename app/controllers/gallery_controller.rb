class GalleryController < ApplicationController
  
  def index

    #tag_cloud
    @images = Image.all.shuffle
    @bg_image = @images.first
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

end
