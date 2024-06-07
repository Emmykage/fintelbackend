class WalletSerializer < ActiveModel::Serializer
  attributes :id, :wallet_balance,  :net_earnings, :user, :total_value, :total_profits, :bonus


  has_many :transactions
  # belongs_to :user
end