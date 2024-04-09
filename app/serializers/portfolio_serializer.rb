class PortfolioSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  belongs_to :plan
end
