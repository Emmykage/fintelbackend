class User < ApplicationRecord
    has_secure_password

    has_one :wallet
    has_many :portfolios
    has_many :transactions, through: :wallet
    
    

    validates :email, :last_name, :first_name,  presence: true

    enum :role, {client: 0, admin: 1} 

    def total_earnings #based on profits
        if portfolios.any?
        portfolios.collect{|portfolio| portfolio.valid? ? portfolio.investment_interest : 0}.sum
        else
            0.0
        end
    end

    # def top_portfolio
    #     portfolios.order(created_at: :asc).first
    
    # end
end
