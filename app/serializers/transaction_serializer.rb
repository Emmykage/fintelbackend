class TransactionSerializer < ActiveModel::Serializer
  attributes :id , :amount , :coin_type, :address, :transaction_type
  belongs_to :wallet
end