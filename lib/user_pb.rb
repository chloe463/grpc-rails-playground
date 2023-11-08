# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: user.proto

require 'google/protobuf'


descriptor_data = "\n\nuser.proto\x12\x0emypackage.user\" \n\x04User\x12\n\n\x02id\x18\x01 \x01(\x05\x12\x0c\n\x04name\x18\x02 \x01(\t\"#\n\x0fListUserRequest\x12\x10\n\x08user_ids\x18\x01 \x03(\x05\"7\n\x10ListUserResponse\x12#\n\x05items\x18\x01 \x03(\x0b\x32\x14.mypackage.user.User\"\x1c\n\x0eGetUserRequest\x12\n\n\x02id\x18\x01 \x01(\x05\"5\n\x0fGetUserResponse\x12\"\n\x04user\x18\x01 \x01(\x0b\x32\x14.mypackage.user.User2\x9d\x01\n\x0bUserService\x12M\n\x08ListUser\x12\x1f.mypackage.user.ListUserRequest\x1a .mypackage.user.ListUserResponse\x12?\n\x07GetUser\x12\x1e.mypackage.user.GetUserRequest\x1a\x14.mypackage.user.Userb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError => e
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Mypackage
  module User
    User = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("mypackage.user.User").msgclass
    ListUserRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("mypackage.user.ListUserRequest").msgclass
    ListUserResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("mypackage.user.ListUserResponse").msgclass
    GetUserRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("mypackage.user.GetUserRequest").msgclass
    GetUserResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("mypackage.user.GetUserResponse").msgclass
  end
end