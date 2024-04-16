class Api::V1::WalletsController < ApplicationController
  before_action :set_wallet, only: %i[ show update destroy ]
  before_action :authorize
  # before_action :initialize_wallet

  # GET /wallets
  def index
    @wallet = @current_user.wallet

    render json: @wallet
  end

  def get_adminstat
    profits = @current_user.wallet
    render json: profits, status: :ok
  end

  # GET /wallets/1
  def show
    render json: @wallet
  end

  # POST /wallets
  def create
    @wallet = Wallet.new(wallet_params)

    if @wallet.save
      render json: @wallet, status: :created
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wallets/1
  def update
    if @wallet.update(wallet_params)
      render json: @wallet
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wallets/1
  def destroy
    @wallet.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet
      @wallet = Wallet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wallet_params
      params.require(:wallet).permit(:balance, :user_id)
    end
end
