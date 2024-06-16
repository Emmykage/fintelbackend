class CreateInterestInstructionJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Portfolio.all.each do |portfolio|

      # PortfolioInterest.create(portfolio: portfolio, amount: calculated_amount(amount))
    portfolio_interest = portfolio.portfolio_interests.create(interest: calculated_amount(portfolio))
    end
  end


  def calculated_amount(portfolio)

    unless portfolio.plan.rate
      portfolio.amount * 0.1
    else
      portfolio.amount * portfolio.plan.rate
    end


  end
end
