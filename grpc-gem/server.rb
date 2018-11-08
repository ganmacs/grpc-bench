# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('./../benchmark/grpc_testing')

require 'grpc'
require 'services_services_pb'

class Bench < ::Grpc::Testing::BenchmarkService::Service
  def unary_call(req, _unused_call)
    ::Grpc::Testing::SimpleResponse.new(
      payload: Grpc::Testing::Payload.new(type: Grpc::Testing::PayloadType::UNCOMPRESSABLE),
    )
  end

  def streaming_call(_, _unused_call)
    raise # not support now
  end
end

port = '0.0.0.0:50051'
s = GRPC::RpcServer.new
s.add_http2_port(port, :this_port_is_insecure)
s.handle(Bench.new)

p "-- Start --"
s.run_till_terminated
p "-- Stop --"
