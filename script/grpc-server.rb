# be rails runner script/grpc-server.rb

server = GRPC::RpcServer.new
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle(GreeterService)
server.run_till_terminated
