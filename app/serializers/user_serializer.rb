class UserSerializer < ActiveModel::Serializer
  attributes :id , :last_name, :first_name, :phone_no, :email, :transactions,:top_portfolio, :password, :total_earnings, :referrer_id, :referral_code

  has_one :wallet
  has_many :portfolios

end