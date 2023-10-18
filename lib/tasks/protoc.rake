namespace :protoc do
  desc 'Generate codes from .proto file'
  task generate: :environment do
    system('grpc_tools_ruby_protoc -I app/protos --ruby_out=app/lib --grpc_out=app/lib app/protos/enquete.proto')

    # cf. https://github.com/grpc/grpc/issues/6164#issuecomment-1003781054
    Dir['app/lib/*_pb.rb'].each do |file|
      puts file
      File.write(file, File.read(file).gsub(/require '(\w+)_pb'/, "require_relative '\\1_pb'"))
    end
  end
end
