class Portfolio < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :portfolio_interests

  enum :status, {active: 0, inactive: 1}

  def investment_interest 
    if portfolio_interests.any?
      portfolio_interests.collect{|profit| profit.interest}.sum
      else
      0.0
    end
    
  end

 
end