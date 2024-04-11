class PocketSerializer < ActiveModel::Serializer
  attributes :id, :name, :code
  has_one :user
end
