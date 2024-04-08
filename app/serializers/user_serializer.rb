class UserSerializer < ActiveModel::Serializer
  attributes :id, :last_name, :first_name, :phone_no, :email

  has_one :wallet
  has_many :portfolios
end
