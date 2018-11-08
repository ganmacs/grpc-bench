# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: stats.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "grpc.testing.ServerStats" do
    optional :time_elapsed, :double, 1
    optional :time_user, :double, 2
    optional :time_system, :double, 3
  end
  add_message "grpc.testing.HistogramParams" do
    optional :resolution, :double, 1
    optional :max_possible, :double, 2
  end
  add_message "grpc.testing.HistogramData" do
    repeated :bucket, :uint32, 1
    optional :min_seen, :double, 2
    optional :max_seen, :double, 3
    optional :sum, :double, 4
    optional :sum_of_squares, :double, 5
    optional :count, :double, 6
  end
  add_message "grpc.testing.ClientStats" do
    optional :latencies, :message, 1, "grpc.testing.HistogramData"
    optional :time_elapsed, :double, 2
    optional :time_user, :double, 3
    optional :time_system, :double, 4
  end
end

module Grpc
  module Testing
    ServerStats = Google::Protobuf::DescriptorPool.generated_pool.lookup("grpc.testing.ServerStats").msgclass
    HistogramParams = Google::Protobuf::DescriptorPool.generated_pool.lookup("grpc.testing.HistogramParams").msgclass
    HistogramData = Google::Protobuf::DescriptorPool.generated_pool.lookup("grpc.testing.HistogramData").msgclass
    ClientStats = Google::Protobuf::DescriptorPool.generated_pool.lookup("grpc.testing.ClientStats").msgclass
  end
end