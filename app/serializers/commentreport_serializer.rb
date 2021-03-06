class CommentreportSerializer < ActiveModel::Serializer
  attributes :id, :reason

  belongs_to :comment
end
