class PostreportSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :reason

  belongs_to :post
end
