class PlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :value
  has_many :portfolios
end
