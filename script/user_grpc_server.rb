# be rails runner script/grpc-server.rb

module MyLogger
  LOGGER = Logger.new $stderr, level: Logger::DEBUG
  def logger
    LOGGER
  end
end

def setup_signal_handlers(server)
  Signal.trap('TERM') do
    puts 'Recieved TERM signal. Shutting down...'
    server.stop
  end

  Signal.trap('INT') do
    puts 'Recieved INT signal. Shutting down...'
    server.stop
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

host = ENV['HOST'] || '0.0.0.0'
port = ENV['USER_SERVICE_PORT'] || '50052'
uri = "#{host}:#{port}"

server = GRPC::RpcServer.new(
  pool_size: ENV.fetch('GRPC_POOL_SIZE', 5).to_i, # worker プロセス数
  max_waiting_requests: ENV.fetch('GRPC_MAX_WAITING', 100).to_i, # 最大待機リクエスト数
  pool_keep_alive: ENV.fetch('GRPC_KEEP_ALIVE', 1800).to_i, # プール保持時間（秒）
  interceptors: [MyInterceptor.new]
  # connect_md_proc: method(:connect_md_proc) # メタデータ処理（必要な場合）
)
server.add_http2_port(uri, :this_port_is_insecure)
GRPC.logger.debug("Server is running on #{uri}")
server.handle(UserService)

setup_signal_handlers(server)
server.run_till_terminated_or_interrupted(%w[INT TERM])

