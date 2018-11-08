#!/bin/bash

pushd griffin

bundle check || bundle install

bundle exec ruby server.rb

popd
