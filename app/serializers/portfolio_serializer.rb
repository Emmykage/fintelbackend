class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :status, :amount

  has_many :portfolio_interests

  belongs_to :plan
end