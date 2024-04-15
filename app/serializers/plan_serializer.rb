class PlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :rate
  has_many :portfolios
end
