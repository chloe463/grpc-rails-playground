require 'google/protobuf/timestamp_pb'
require_relative '../lib/enquete_services_pb'

class EnqueteService < Mypackage::Enquete::EnqueteService::Service
  def list_enquete(req, _unused_call)
    raw_enquetes = Enquete
                   .includes(:questions, :options)
                   .offset(req.offset)
                   .limit(req.limit)
    enquetes = raw_enquetes.map do |e|
      EnqueteSerializer.new(e).to_pb
    end
    Mypackage::Enquete::ListEnqueteResponse.new(enquetes:)
  end

  def get_enquete(req, _call)
    raw_enquete = Enquete.find(req.enquete_id)
    Mypackage::Enquete::GetEnqueteResponse.new(enquete: EnqueteSerializer.new(raw_enquete).to_pb)
  end
end
