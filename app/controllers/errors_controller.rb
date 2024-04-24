class ErrorsController < ApplicationController
  before_action :set_error, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /errors or /errors.json
  def index
    @errors = Error.all
  end

  # GET /errors/1 or /errors/1.json
  def show
  end

  # GET /errors/new
  def new
    @error = Error.new
    @error = current_user.error.build
  end

  # GET /errors/1/edit
  def edit
  end

  # POST /errors or /errors.json
  def create
    @error = Error.new(error_params)
    @error = current_user.error.build(error_params)

    respond_to do |format|
      if @error.save
        format.html { redirect_to error_url(@error), notice: "Error was successfully created." }
        format.json { render :show, status: :created, location: @error }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @error.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /errors/1 or /errors/1.json
  def update
    respond_to do |format|
      if @error.update(error_params)
        format.html { redirect_to error_url(@error), notice: "Error was successfully updated." }
        format.json { render :show, status: :ok, location: @error }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @error.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /errors/1 or /errors/1.json
  def destroy
    @error.destroy!

    respond_to do |format|
      format.html { redirect_to errors_url, notice: "Error was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @error = current_user.error.find_by(id: params[:id])
    redirect_to errors_path, notice: "Not Authorized to Edit This Error" if @error.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_error
      @error = Error.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def error_params
      params.require(:error).permit(:name, :priority, :description, :person_assigned, :date_found, :progress, :user_id)
    end
end

require 'csv'

  def index
    @errors = Error.all
    respond_to do |format|
      format.html
      format.csv do
        filename = ['Errors', Date.today].join(' ')
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=#{filename}.csv"
        render template: 'errors/index'
      end
    end
  end
