class Api::V1::PocketsController < ApplicationController
  before_action :set_pocket, only: %i[ show destroy ]
  before_action :authorize
  
  # GET /pockets
  def index
    @pockets = Pocket.all
    render json: @pockets
  end

  # GET /pockets/1
  def show
    render json: @pocket
  end

  def get_pocket
    user = User.find_by(role: "admin")
    pocket = Pocket.find_by(user_id: user.id )
    render json: pocket
  
  end

  # POST /pockets
  def create
    @pocket = Pocket.new(pocket_params)

    if @pocket.save
      render json: @pocket, status: :created
    else
      render json: @pocket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pockets/1
  def update
    @pocket = @current_user.pocket
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
      params.require(:pocket).permit(:name, :user_id, :eth, :btc, :bank)
    end
end
