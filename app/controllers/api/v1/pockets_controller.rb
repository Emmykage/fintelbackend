class Api::v1::PocketsController < ApplicationController
  before_action :set_pocket, only: %i[ show update destroy ]
  
  # GET /pockets
  def index
    @pockets = Pocket.all

    render json: @pockets
  end

  # GET /pockets/1
  def show
    render json: @pocket
  end

  # POST /pockets
  def create
    @pocket = Pocket.new(pocket_params)

    if @pocket.save
      render json: @pocket, status: :created, location: @pocket
    else
      render json: @pocket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pockets/1
  def update
    if @pocket.update(pocket_params)
      render json: @pocket
    else
      render json: @pocket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pockets/1
  def destroy
    @pocket.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pocket
      @pocket = Pocket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pocket_params
      params.require(:pocket).permit(:name, :code, :user_id)
    end
end
