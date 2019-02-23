class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]


  # GET /tracks
  # GET /tracks.json



  def index
    if current_user.try(:artist?)

    # @tracks = Track.all
    @tracks = current_user.tracks.all

      else
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'You must be logged in to view this page.' }
          format.json { head :no_content }
        end
      end

  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
    if current_user.try(:admin?)
  @track = Track.find(params[:id])
    else
  redirect_to root_path, notice: 'You cannot access this track' unless current_user.id == @track.user_id
    end
  end

    # if current_user.try(:artist?)
    # @track = Track.find params[:id]
    #
    # else
    #   respond_to do |format|
    #     format.html { redirect_to root_path, notice: 'Oops, there is no track here.' }
    #     format.json { head :no_content }
    #   end
    # end
  # end

  # GET /tracks/new
  def new
    if current_user.try(:admin?)
     @track = Track.new
    else
     redirect_to root_path, notice: 'You cannot create new tracks'
   end
  end

  # GET /tracks/1/edit
  def edit
    if current_user.try(:admin?)
    else
     redirect_to root_path, notice: 'You cannot edit tracks'
    end
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
    # # @track = current_user.tracks(track_params)
    # @track = current_user.tracks.find_by_id(params[:id])


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
