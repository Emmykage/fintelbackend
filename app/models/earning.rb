class Earning < ApplicationRecord
  belongs_to :wallet
  has_many :earning_transactions


  def withdraw_earning
    if earning_transactions.any?
     earning_transactions.collect{|transaction| transaction.amount.nil? ? 0 : transaction.amount }.sum

    else
        0.0
    end
  
  end

  def profit
    0.0
  end
end