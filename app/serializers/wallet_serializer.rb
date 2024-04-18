class WalletSerializer < ActiveModel::Serializer
  attributes :id, :wallet_balance,  :net_earnings, :total_profits, :user, :total_value


  has_many :transactions 
  # belongs_to :user
end