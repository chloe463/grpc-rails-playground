require_relative '../lib/hello_services_pb'

class GreeterService < Hello::Greeter::Service
  def say_hello(hello_req, _unused_call)
    Hello::HelloReply.new(message: "Hi! #{hello_req.name}")
  end

  def get_hello(req, _unused_call)
    Hello::GetHelloResponse.new(message: "Hello #{req.n}")
  end
end
