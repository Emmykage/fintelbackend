class PocketSerializer < ActiveModel::Serializer
  attributes :id, :name , :btc, :bank, :eth
end
