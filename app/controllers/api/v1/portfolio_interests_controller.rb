class Api::V1::PortfolioInterestsController < ApplicationController
  before_action :authorize
  before_action :set_portfolio_interest, only: %i[ show update destroy ]
  before_action :set_portfolio, only: %i[create]

  before_action :set_user_portfolio, only: %i[index]
  # GET /portfolio_interests
  def index
    @portfolio_interests = portfolio_interests.order(created_at: :desc)

    render json: @portfolio_interests
  end

  # GET /portfolio_interests/1
  def show
    render json: @portfolio_interest
  end

  # POST /portfolio_interests
  def create

    @portfolio_interest = @portfolio.portfolio_interests.new(portfolio_interest_params)

    if @portfolio_interest.save
      render json: @portfolio_interest, status: :created
    else
      render json: @portfolio_interest.errors, status: :unprocessable_entity
    end
  end

  def create_interests


    CreateInterestInstructionJob.perform_now


  end

  # PATCH/PUT /portfolio_interests/1
  def update
    if @portfolio_interest.update(portfolio_interest_params)
      render json: @portfolio_interest
    else
      render json: @portfolio_interest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /portfolio_interests/1
  def destroy
    @portfolio_interest.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_interest
      @portfolio_interest = PortfolioInterest.find(params[:id])
    end

    def set_portfolio
      @portfolio = Portfolio.find(params[:portfolio_id])

    end


    # Only allow a list of trusted parameters through.
    def portfolio_interest_params
      params.require(:portfolio_interest).permit(:interest, :widthdrawn)
    end
end
