require_relative '../../lib/enquete_pb'

class EnqueteSerializer < Pb::Serializer::Base
  message Mypackage::Enquete::Enquete

  attribute :id
  attribute :title
  attribute :description
  attribute :status
  attribute :start_at
  attribute :end_at
  attribute :created_at
  attribute :updated_at

  attribute :questions, serializer: QuestionSerializer

  def status
    "STATUS_#{object.status.upcase}".to_sym
    # object.status_before_type_cast
  end

  def start_at
    Pb.to_timestamp(object.start_at)
  end

  def end_at
    Pb.to_timestamp(object.end_at)
  end

  def created_at
    Pb.to_timestamp(object.created_at)
  end

  def updated_at
    Pb.to_timestamp(object.updated_at)
  end
end
