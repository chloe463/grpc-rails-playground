require_relative '../../lib/user_pb'

class UserSerializer < Pb::Serializer::Base
  message Mypackage::User::User

  attribute :id
  attribute :name
end
