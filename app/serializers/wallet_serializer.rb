class WalletSerializer < ActiveModel::Serializer
  attributes :id, :wallet_balance, :transactions

  has_many :transactions 
  belongs_to :user
end