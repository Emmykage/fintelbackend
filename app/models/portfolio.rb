class Portfolio < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :portfolio_interests
end
