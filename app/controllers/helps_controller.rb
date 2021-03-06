class HelpsController < ApplicationController
  before_action :set_help, only: %i[ show edit update destroy ]

  # GET /helps or /helps.json
  def index
    @helps = Help.all
  end

  # GET /helps/1 or /helps/1.json
  def show
  end

  # GET /helps/new
  def new
    @help = Help.new
  end

  # GET /helps/1/edit
  def edit
  end

  # POST /helps or /helps.json
  def create
    @help = Help.new(help_params)

    respond_to do |format|
      if @help.save
        format.html { redirect_to @help, notice: "Help was successfully created." }
        format.json { render :show, status: :created, location: @help }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /helps/1 or /helps/1.json
  def update
    respond_to do |format|
      if @help.update(help_params)
        format.html { redirect_to @help, notice: "Help was successfully updated." }
        format.json { render :show, status: :ok, location: @help }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helps/1 or /helps/1.json
  def destroy
    @help.destroy
    respond_to do |format|
      format.html { redirect_to helps_url, notice: "Help was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help
      @help = Help.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def help_params
      params.fetch(:help, {})
    end
end
