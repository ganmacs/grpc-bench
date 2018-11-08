#!/bin/bash

pushd benchmark

go run server/main.go --port=50051 --test_name="Server_go"

popd
