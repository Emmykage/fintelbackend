class CreateInterestInstructionJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Portfolio.all.each do |portfolio|     
      
      # PortfolioInterest.create(portfolio: portfolio, amount: calculated_amount(amount))
    portfolio_interest = portfolio.portfolio_interests.create(interest: calculated_amount(portfolio))
      # binding.b
    end
  end


  def calculated_amount(portfolio)
      portfolio.amount * 0.1
  end
end
