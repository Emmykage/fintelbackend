class Wallet < ApplicationRecord
  belongs_to :user
  has_one :earning
  has_many :transactions

  def deposit
    if transactions.where(transaction_type: "deposit").any?
      transactions.where(transaction_type: "deposit").where(status: "approved").collect{|transaction| transaction.amount }.sum
    else
      0.0
    end
  end  
  def withdrawal
    if transactions.where(transaction_type: "withdrawal").any?
      transactions.where(transaction_type: "withdrawal").where(status: "approved").collect{|transaction| transaction.amount }.sum
    else
      0.0
    end 
   end

   def wallet_balance

    (user.total_withdrawn_earnings +  deposit + earning.withdraw_earning) - (withdrawal)
 
  end  

  def value 
    (deposit + user.total_assets + total_earnings) - (withdrawal )

    
  end

  def total_value 
    (user.total_earnings + user.total_assets) - (earning.withdraw_earning)
    
  end

  def profits 
    user.total_earnings
  end

  def total_profits
    profits
    
  end

  def net_earnings #sum total of interest and earning withdrawal
    user.total_earnings -  earning.withdraw_earning
    # withdraw_earning
  

  end
end
