class Wallet < ApplicationRecord
  belongs_to :user
  has_one :earning
  has_many :transactions

  def deposit
    if transactions.where(transaction_type: "deposit").any?
      transactions.where(transaction_type: "deposit").where(status: "completed").collect{|transaction| transaction.amount }.sum
    else
      0.0
    end
  end  
  def withdrawal
    if transactions.where(transaction_type: "withdraw").any?
      transactions.where(transaction_type: "withdraw").where(status: "completed").collect{|transaction| transaction.amount }.sum
    else
      0.0
    end 
   end

   def wallet_balance
    deposit - withdrawal

  end  

  def profits 
    user.total_earnings
    
  end

  def net_earnings #sum total of interest and earning withdrawal
    user.total_earnings -  earning.withdraw_earning
    # withdraw_earning
  

  end
end
