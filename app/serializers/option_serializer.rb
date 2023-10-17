class OptionSerializer < Pb::Serializer::Base
  message Mypackage::Enquete::Option

  attribute :id
  attribute :question_id
  attribute :text
  attribute :created_at
  attribute :updated_at

  def created_at
    Pb.to_timestamp(object.created_at)
  end

  def updated_at
    Pb.to_timestamp(object.updated_at)
  end
end
