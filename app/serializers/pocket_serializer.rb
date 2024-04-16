class PocketSerializer < ActiveModel::Serializer
  attributes :id, :name , :btc, :bank, :eth, :user
  # belongs_to :user
end
