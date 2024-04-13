class Statistic < ApplicationRecord

    def totalUsers 
        User.all.length
      
    end

    def totalProfit 
     portfolios = Portfolio.all
     portfolios.where(status: "active").collect{|portfolio| portfolio.amount}.sum
      
    end

    def totalDeposits
        Transaction.all.where(transaction_type: "deposit").collect{|transaction| transaction.amount}.sum
      
    end

    def totalWithdrawal 
        Transaction.all.where(transaction_type: "withdrawal").collect{|transaction| transaction.amount}.sum
      
    end
end
