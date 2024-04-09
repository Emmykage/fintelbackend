class TransactionSerializer < ActiveModel::Serializer
  attributes :id , :amount , :coin_type, :address, :transaction_type, :created_at, :status
  belongs_to :wallet
end