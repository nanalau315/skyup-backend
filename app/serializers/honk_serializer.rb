class HonkSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :post_id
end
