class Api::V1::TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show update destroy ]
  before_action :authorize
  before_action :get_wallet, only: %i[create]
  
  # GET /transactions
  def index
    @transactions = @current_user.wallet.transactions

    render json: @transactions
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  # POST /transactions
  def create
    @transaction = @wallet.transactions.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def get_wallet 
      @wallet = @current_user.wallet
      
    end
    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:amount, :transaction_type, :status, :address, :coin_type)
    end
end
