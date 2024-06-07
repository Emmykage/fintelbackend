class User < ApplicationRecord
    has_secure_password

    has_one :wallet
    has_many :portfolios
    has_one :pocket
    has_many :transactions, through: :wallet
    has_many :bonuses, through: :wallet

    validates :email, :last_name, :first_name,  presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: { in: 6..20 }
    validates :email, uniqueness: true, format: { with: /\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,})+\z/i, message: ":Please enter a valid email address."}


    enum :role, {client: 0, admin: 1}

    before_create :generate_confirmation_token
    before_create :downcase_email
    before_create :generate_referral_code
    after_create :send_confirmation_token



    def total_assets     #based on active assets
        if portfolios.where(status: "active").any?
            portfolios.where(status: "active").collect{|portfolio| portfolio.valid? ? portfolio.amount : 0}.sum
        else
            0.0
        end
    end

    def total_inactive_assets     #based on liquidated or inactive  assets
        if portfolios.where(status: "inactive").any?
            portfolios.where(status: "inactive").collect{|portfolio| portfolio.valid? ? portfolio.amount : 0}.sum
        else
            0.0
        end
    end

    def total_earnings #based on active  profits
        if portfolios.where(status: "active").any?
        portfolios.where(status: "active").collect{|portfolio| portfolio.valid? ? portfolio.investment_interest : 0}.sum
        else
            0.0
        end
    end

    # def total_withdrawn_earnings #based on liquidated  profits
    #     if portfolios.where(status: "inactive").any?
    #            portfolios.where(status: "inactive").collect{|portfolio| portfolio.valid? ? portfolio.investment_interest : 0}.sum
    #     else
    #         0.0
    #     end
    # end

    def total_withdrawn_earnings #based on liquidated  profits
        if portfolios.where(status: "active").any?
               portfolios.where(status: "active").collect{|portfolio| portfolio.valid? ? portfolio.withdrawn_interest : 0}.sum
        else
            0.0
        end
    end

    def top_portfolio
        portfolios.order(created_at: :asc).first

    end

    def balance
        wallet.wallet_balance

    end


    private
    def generate_confirmation_token
          self.confirmation_token =  SecureRandom.hex(10)
          self.confirmation_sent_at = Time.now
    end

    def send_confirmation_token
        SendConfirmationInstructionJob.perform_later(self)
    end

    def downcase_email
        self.email = email.downcase if email.present?
    end

    def generate_referral_code
        self.referral_code = SecureRandom.hex(10)
    end

end
