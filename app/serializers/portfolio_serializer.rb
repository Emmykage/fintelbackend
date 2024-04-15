class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :status, :amount, :rate
  # belongs_to :user
  has_many :portfolio_interests

  belongs_to :plan
end