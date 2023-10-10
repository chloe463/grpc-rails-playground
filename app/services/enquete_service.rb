require 'google/protobuf/timestamp_pb'
require_relative '../lib/enquete_services_pb.rb'

class EnqueteService < Mypackage::Enquete::EnqueteService::Service
  def list_enquete(req, _unused_call)
    raw_enquetes = Enquete
      .offset(req.offset)
      .limit(req.limit)
    enquetes = raw_enquetes.map do |e|
      Mypackage::Enquete::Enquete.new(
        id: e.id,
        title: e.title,
        description: e.description,
        status: "STATUS_#{e.status.to_s.upcase}",
        start_at: Google::Protobuf::Timestamp.new(seconds: e.start_at.to_i),
        end_at: Google::Protobuf::Timestamp.new(seconds: e.end_at.to_i),
        created_at: Google::Protobuf::Timestamp.new(seconds: e.created_at.to_i),
        updated_at: Google::Protobuf::Timestamp.new(seconds: e.updated_at.to_i),
      )
    end
    Mypackage::Enquete::ListEnqueteResponse.new(enquetes: enquetes.to_a)
  end

  def get_enquete(req, _call)
    raw_enquete = Enquete.find(req.enquete_id)
    enquete = Mypackage::Enquete::Enquete.new(
      id: raw_enquete.id,
      title: raw_enquete.title,
      description: raw_enquete.description,
      status: "STATUS_#{raw_enquete.status.to_s.upcase}",
      start_at: Google::Protobuf::Timestamp.new(seconds: raw_enquete.start_at.to_i),
      end_at: Google::Protobuf::Timestamp.new(seconds: raw_enquete.end_at.to_i),
      created_at: Google::Protobuf::Timestamp.new(seconds: raw_enquete.created_at.to_i),
      updated_at: Google::Protobuf::Timestamp.new(seconds: raw_enquete.updated_at.to_i),
    )
    Mypackage::Enquete::GetEnqueteResponse.new(enquete: enquete)
  end
end
