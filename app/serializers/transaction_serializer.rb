class TransactionSerializer < ActiveModel::Serializer
  attributes :id , :amount , :coin_type, :address, :transaction_type, :created_at, :status, :user, :proof_url
  belongs_to :wallet
end