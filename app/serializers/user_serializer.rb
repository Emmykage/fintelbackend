class UserSerializer < ActiveModel::Serializer
  attributes :id, :last_name, :first_name, :phone_no, :email, :transaction
  # , :top_portfolio

  has_one :wallet
  has_many :portfolios

end
