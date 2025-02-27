class Portfolio < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :portfolio_interests

  before_create :valid_transaction?

  enum :status, {active: 0, inactive: 1}

  def investment_interest 
    if portfolio_interests.any?
      portfolio_interests.collect{|profit| profit.interest}.sum
      else
      0.0
    end
    
  end 
  def withdrawn_interest
    if portfolio_interests.where(withdrawn: true).any?
      portfolio_interests.where(withdrawn: true).collect{|profit| profit.interest}.sum
      
    else
      0.0
    end
  end
  def valid_transaction?
    
    raise ActiveRecord::RecordNotSaved, "You have limited funds in your wallet"  unless amount < user.balance 

    true
    
  end
end