class QuestionSerializer < Pb::Serializer::Base
  message Mypackage::Enquete::Question

  attribute :id
  attribute :enquete_id
  attribute :text
  attribute :format
  attribute :required
  attribute :created_at
  attribute :updated_at

  def format
    "FORMAT_#{object.format.upcase}".to_sym
  end

  def created_at
    Pb.to_timestamp(object.created_at)
  end

  def updated_at
    Pb.to_timestamp(object.updated_at)
  end
end
