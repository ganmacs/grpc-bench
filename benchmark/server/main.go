/*
 *
 * Copyright 2017 gRPC authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package main

import (
	"flag"
	"fmt"
	"net"
	"os"
	"os/signal"

	"google.golang.org/grpc/benchmark"
	"google.golang.org/grpc/grpclog"
)

var (
	port     = flag.String("port", "50051", "Localhost port to listen on.")
	testName = flag.String("test_name", "", "Name of the test used for creating profiles.")
)

func main() {
	flag.Parse()
	if *testName == "" {
		grpclog.Fatalf("test name not set")
	}
	lis, err := net.Listen("tcp", ":"+*port)
	if err != nil {
		grpclog.Fatalf("Failed to listen: %v", err)
	}
	defer lis.Close()
	fmt.Println("-- Start --")

	stop := benchmark.StartServer(benchmark.ServerInfo{Type: "protobuf", Listener: lis})
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, os.Interrupt)
	<-ch
	stop()

	fmt.Println("-- Finish --")
}
