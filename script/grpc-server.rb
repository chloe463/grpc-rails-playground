# be rails runner script/grpc-server.rb

module MyLogger
  LOGGER = Logger.new $stderr, level: Logger::DEBUG
  def logger
    LOGGER
  end
end

module GRPC
  extend MyLogger
end

class MyInterceptor < GRPC::ServerInterceptor
  def request_response(request: nil, call: nil, method: nil, metadata: nil)
    GRPC.logger.debug("#{method.owner}\##{method.name} is called with request #{request.to_h}")
    yield
  end
end

server = GRPC::RpcServer.new(interceptors: [MyInterceptor.new])
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
GRPC.logger.debug('Server is running on 0.0.0.0:50051')
server.handle(GreeterService)
server.run_till_terminated
