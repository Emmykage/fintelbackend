class PortfolioInterest < ApplicationRecord
  belongs_to :portfolio

  def update_interests
      new_amount = amount +  (portfolio.amount * 0.1)
        update(amount:  new_amount)
  end
end
