require_relative '../lib/enquete_services_pb'

class EnqueteClient
  def initialize(host: '0.0.0.0', port: '50051')
    @stub = Mypackage::Enquete::EnqueteService::Stub.new("#{host}:#{port}", :this_channel_is_insecure)
  end

  def list_enquete
    request = Mypackage::Enquete::ListEnqueteRequest.new(filter: nil, offset: 0, limit: 10)
    response = @stub.list_enquete(request)
    response.enquetes
  end

  def get_enquete
    request = Mypackage::Enquete::GetEnqueteRequest.new(enquete_id: 1)
    response = @stub.get_enquete(request)
    response.enquete
  end
end

client = EnqueteClient.new(host: ENV['HOST'], port: ENV['PORT'])
client.list_enquete.each do |e|
  puts e.to_json
end

puts client.get_enquete.to_json
