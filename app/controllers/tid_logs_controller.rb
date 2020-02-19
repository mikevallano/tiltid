class TidLogsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_tid_log, only: [:show, :edit, :update, :destroy]
  before_action :validate_tid_log_user, only: [:edit, :update, :destroy]

  # GET /tid_logs
  # GET /tid_logs.json
  def index
    @tid_logs = current_user.tid_logs
    if params[:tag]
      @tid_logs = @tid_logs.tagged_with(params[:tag])
    end
    if params[:search]
      @tid_logs = @tid_logs.search_for(params[:search])
    end
    @tid_logs = @tid_logs.ordered.paginate(page: params[:page], per_page: 10)
  end

  # GET /tid_logs/1
  # GET /tid_logs/1.json
  def show
    unless @tid_log.user == current_user || @tid_log.public?
      redirect_to root_path, notice: 'Not authorized to view that.'
    end
  end

  # GET /tid_logs/new
  def new
    @tid_log = TidLog.new
  end

  # GET /tid_logs/1/edit
  def edit
  end

  # POST /tid_logs
  # POST /tid_logs.json
  def create
    @tid_log = TidLog.new(tid_log_params)

    respond_to do |format|
      if @tid_log.save
        format.html { redirect_to @tid_log, notice: 'Tid log was successfully created.' }
        format.json { render :show, status: :created, location: @tid_log }
      else
        format.html { render :new }
        format.json { render json: @tid_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tid_logs/1
  # PATCH/PUT /tid_logs/1.json
  def update
    respond_to do |format|
      if @tid_log.update(tid_log_params)
        format.html { redirect_to @tid_log, notice: 'Tid log was successfully updated.' }
        format.json { render :show, status: :ok, location: @tid_log }
      else
        format.html { render :edit }
        format.json { render json: @tid_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tid_logs/1
  # DELETE /tid_logs/1.json
  def destroy
    @tid_log.destroy
    respond_to do |format|
      format.html { redirect_to tid_logs_url, notice: 'Tid log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tid_log
      @tid_log = TidLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tid_log_params
      params.require(:tid_log).permit(:title, :body, :public, :user_id, :tag_list)
    end

    def validate_tid_log_user
      unless @tid_log.user == current_user
        redirect_to tid_logs_path, notice: "Not authorized to view that learning"
      end
    end
end
