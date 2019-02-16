class AdminTracksController < ApplicationController

  before_action :set_track, only: [:show, :edit, :update, :destroy]
  # GET /tracks
  # GET /tracks.json
  def index
    if current_user.try(:admin?)
    @tracks = Track.all
  else
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'You are not authorised to view this page.' }
      format.json { head :no_content }
    end
  end
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
    @track = Track.find params[:id]


  end

  # GET /tracks/new
  def new
     @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    @track = current_user.tracks.save(track_params)

    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    authorize @track
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:title, :url, :user_id, :track_file)
    end
end
