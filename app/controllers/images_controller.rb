class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  #helper ImagesHelper
  before_filter :authenticate_user!, except: [:index, :show]

  def new
    @image = Image.new

    respond_to do |format|
      format.html 
      format.json { render json: @image }
    end
  end

  def show
    @image = Image.find(params[:id])
    #@image = Image.find_by_name(params[:name].gsub("-", " "))
    image_bg = @image.picture.url
    #image_artist_avatar = @image.artist.avatar.thumb('150x150').url
    response = {image: @image,
                image_bg: image_bg}
                #image_artist_avatar: image_artist_avatar}
    respond_to do |format|
      #format.html
      format.json { render :json => response, :include => :artist }

  end
  end

  # GET /images/1/edit
  def edit
    tag_cloud
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(params[:image])

    respond_to do |format|
      if @image.save
        format.html {redirect_to root_url, notice: 'Image was successfully created.' }
        format.json { render json: @image.to_json, status: :created, location: images_url }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to root_url, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end



  protected
  
  def tag_cloud
    @tags = Image.tag_counts_on(:tags)
  end
  
  def img_roll
    display_ids, roll_ids = [], []
    Image.all.each do |i|
      roll_ids << i[:id]
    end
    roll_ids.shuffle.each { |p| display_ids << p }
    display_ids
  end

end
