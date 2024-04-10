class WalletSerializer < ActiveModel::Serializer
  attributes :id, :wallet_balance,  :net_earnings, :profits, :user

  has_many :transactions 
  # belongs_to :user
end