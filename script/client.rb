require_relative '../app/lib/hello_services_pb'

class HelloClient
  def initialize(host: '0.0.0.0', port: '50051')
    @stub = Hello::Greeter::Stub.new("#{host}:#{port}", :this_channel_is_insecure)
  end

  def say_hello(name)
    request = Hello::HelloRequest.new(name: name)
    response = @stub.say_hello(request)
    response.message
  end

  def get_hello
    request = Hello::GetHelloRequest.new(n: 123)
    # binding.irb
    response = @stub.get_hello(request)
    response.message
  end
end

client = HelloClient.new(host: ENV['HOST'], port: ENV['PORT'])
puts client.say_hello('World')
puts client.get_hello
