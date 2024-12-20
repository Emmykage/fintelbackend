class Api::V1::PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[ show update destroy liquidate_profit ]
  before_action :authorize

  # GET /portfolios
  def index
    @portfolios = @current_user.portfolios.order(created_at: :desc)
    render json: @portfolios
  end

  # GET /portfolios/1
  def show
    render json: @portfolio
  end

  # POST /portfolios
  def create

    @portfolio = @current_user.portfolios.new(portfolio_params)

    if @portfolio.save
      render json: @portfolio, status: :created
    else
      render json: @portfolio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /portfolios/1
  def update
    if @portfolio.update(portfolio_params)
      render json: @portfolio
    else
      render json: @portfolio.errors, status: :unprocessable_entity
    end
  end

  def liquidate_profit
    @portfolio_interests = @portfolio.portfolio_interests
    if @portfolio_interests.update_all(withdrawn: true)
      render json: @portfolio_interests
    else
      render json: @portfolio_interests.errors, status: :unprocessable_entity
    end
  end

  # create portfolio interest
  def create_interests
     messages = CreateInterestInstructionJob.perform_now

     render json: {message: "All interest has been added"}, status: :ok


  end


  # DELETE /portfolios/1
  def destroy
    @portfolio.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_params

      params.require(:portfolio).permit(:amount, :paid, :plan_id, :paid, :status, :rate)
    end
end
