# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('./../benchmark/grpc_testing')

require 'griffin'
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

Griffin::Server.configure do |c|
  c.bind '0.0.0.0'

  c.port 50051

  c.services ::Bench.new

  c.log_level :info

  c.workers 2
end

p "-- Start --"
Griffin::Server.run
p "-- Stop --"
