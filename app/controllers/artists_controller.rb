class ArtistsController < ApplicationController



  def index
    @artists = Artist.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artists, :only => [:id, :bio] }
    end
  end
  
  def new
    @artist = Artist.new

    respond_to do |format|
      format.html 
      format.json { render json: @artist }
    end
  end
  
  def edit
    @artist = Artist.find(params[:id])
  end

  def show
    @artist = Artist.find_by_name(params[:name].gsub("-", " "))
    respond_to do |format|
      format.html
      format.json { render json: @artist }
    end
  end
  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(params[:artist])

    respond_to do |format|
      if @artist.save
        format.html {redirect_to artists_url, notice: 'artist was successfully created.' }
        format.json { render json: @artist.to_json, status: :created, location: artists_url }
      else
        format.html { render action: "new" }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /artists/1
  # PUT /artists/1.json
  def update
    @artist = Artist.find(params[:id])

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.html { redirect_to @artist, notice: 'artist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to artists_url }
      format.json { head :no_content }
    end
  end
  
  
end
