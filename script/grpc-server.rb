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
    GRPC.logger.debug("#{method.owner}\##{method.name} is called with request #{request.to_h}, metadata: #{GMSC.safe_convert(call.metadata).to_json}")
    yield
  end
end

host = ENV['HOST']
port = ENV['PORT']
uri = "#{host}:#{port}"

server = GRPC::RpcServer.new(interceptors: [MyInterceptor.new])
server.add_http2_port(uri, :this_port_is_insecure)
GRPC.logger.debug("Server is running on #{uri}")
server.handle(EnqueteService)
server.run_till_terminated
