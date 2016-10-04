require 'rspotify'
class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  # GET /homes
  # GET /homes.json
  def index
    RSpotify.authenticate("30e297c976764d68ba26aff3c79f53cf", "3c890e21be8146868d7c533fa8d69719")
    @homes = Home.all
    @categories = RSpotify::Category.list(locale: 'es_MX', limit: 10)
    @categories_names = RSpotify::Category.list(locale: 'es_MX', limit: 10).map { |e| e.name }
    @categories_playlist = RSpotify::Category.list(locale: 'es_MX', limit: 10).map { |e| e.playlists.count }

    @artists = RSpotify::Artist.search('Ana Tijoux')

    @artists.each do |artist|
      @tracks = artist.top_tracks(:CL)
    end
    @tracks_names = @tracks.map { |e| e.name }
    @tracks_popularity = @tracks.map { |e| e.popularity  }
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.fetch(:home, {})
    end
end
