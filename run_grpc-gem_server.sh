 #!/bin/bash

pushd grpc-gem

bundle check || bundle install

bundle exec ruby server.rb

popd
