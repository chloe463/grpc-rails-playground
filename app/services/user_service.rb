require_relative '../../lib/user_services_pb'

class UserService < Mypackage::User::UserService::Service
  def list_user(req, _unused_call)
    if req.user_ids.count > 0
      raw_users = User.where(id: req.user_ids)
    else
      raw_users = User.all
    end

    users = raw_users.map do |u|
      UserSerializer.new(u).to_pb
    end
    Mypackage::User::ListUserResponse.new(users:)
  end

  def get_user(req, _call)
    raw_user = User.find(req.id)

    Mypackage::User::GetUserResponse.new(user: UserSerializer.new(raw_user).to_pb)
  end
end
