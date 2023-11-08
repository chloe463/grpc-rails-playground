require_relative '../lib/user_services_pb'

class UserServiceClient
  def initialize(host: '0.0.0.0', port: '50052')
    @stub = Mypackage::User::UserService::Stub.new("#{host}:#{port}", :this_channel_is_insecure)
  end

  def list_user
    request = Mypackage::User::ListUserRequest.new(user_ids: [])
    response = @stub.list_user(request)
    response.items
  end

  def get_user
    request = Mypackage::User::GetUserRequest.new(id: 1)
    response = @stub.get_user(request)
    response
  end
end

client = UserServiceClient.new
client.list_user.each do |u|
  puts u.to_json
end

puts client.get_user.to_json
