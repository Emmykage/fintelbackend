class TransactionSerializer < ActiveModel::Serializer
  attributes :id , :amount , :coin_type, :address, :transaction_type, :created_at, :status, :user, :proof_url
  belongs_to :wallet

  # def proof_url
  #   if object.proof.attached?
  #     Rails.application.routes.url_helpers.rails_blob_path(object.proof, only_path: true)
  #     # Rails.application.routes.url_helpers.rails_blob_path(object.proof, only_path: true)
  #   else
  #     nil

  #   end
  # end
  
end