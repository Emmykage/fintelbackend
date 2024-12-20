class CreateInterestInstructionJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Portfolio.all.each do |portfolio|

      interest_amount = calculated_amount(portfolio)

      # PortfolioInterest.create(portfolio: portfolio, amount: calculated_amount(amount))
    portfolio.portfolio_interests.create(interest: interest_amount)

    end
  end


  def calculated_amount(portfolio)

    rate = portfolio.plan&.rate || 0.1

    portfolio.amount * rate



  end
end
