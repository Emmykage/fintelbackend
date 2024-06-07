class BonusSerializer < ActiveModel::Serializer
  attributes :id, :amount
  has_one :wallet
end
