class WalletSerializer < ActiveModel::Serializer
  attributes :id, :wallet_balance,  :net_earnings, :profits, :user, :total_value


  has_many :transactions 
  # belongs_to :user
end