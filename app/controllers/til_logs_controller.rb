class TilLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_til_log, only: [:show, :edit, :update, :destroy]
  before_action :validate_til_log_user, only: [:edit, :update, :destroy]

  # GET /til_logs
  # GET /til_logs.json
  def index
    @til_logs = current_user.til_logs
    if params[:tag]
      @til_logs = @til_logs.tagged_with(params[:tag])
    end
    if params[:search]
      @til_logs = @til_logs.search_for(params[:search])
    end
  end

  # GET /til_logs/1
  # GET /til_logs/1.json
  def show
    unless @til_log.user == current_user || @til_log.public?
      redirect_to til_logs_path, notice: 'Not authorized to view that.'
    end
  end

  # GET /til_logs/new
  def new
    @til_log = TilLog.new
  end

  # GET /til_logs/1/edit
  def edit
  end

  # POST /til_logs
  # POST /til_logs.json
  def create
    @til_log = TilLog.new(til_log_params)

    respond_to do |format|
      if @til_log.save
        format.html { redirect_to @til_log, notice: 'Til log was successfully created.' }
        format.json { render :show, status: :created, location: @til_log }
      else
        format.html { render :new }
        format.json { render json: @til_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /til_logs/1
  # PATCH/PUT /til_logs/1.json
  def update
    respond_to do |format|
      if @til_log.update(til_log_params)
        format.html { redirect_to @til_log, notice: 'Til log was successfully updated.' }
        format.json { render :show, status: :ok, location: @til_log }
      else
        format.html { render :edit }
        format.json { render json: @til_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /til_logs/1
  # DELETE /til_logs/1.json
  def destroy
    @til_log.destroy
    respond_to do |format|
      format.html { redirect_to til_logs_url, notice: 'Til log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_til_log
      @til_log = TilLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def til_log_params
      params.require(:til_log).permit(:title, :body, :public, :user_id, :tag_list)
    end

    def validate_til_log_user
      unless @til_log.user == current_user
        redirect_to til_logs_path, notice: "Not authorized to view that learning"
      end
    end
end
