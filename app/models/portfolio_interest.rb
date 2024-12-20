class PortfolioInterest < ApplicationRecord
  belongs_to :portfolio

  default_scope {order(created_at: :desc)}

  def update_interests
      new_amount = amount +  (portfolio.amount * 0.1)
        update(amount:  new_amount)
  end
end
