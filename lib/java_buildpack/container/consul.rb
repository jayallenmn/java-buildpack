# Encoding: utf-8
# Cloud Foundry Java Buildpack
# Copyright 2013-2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'java_buildpack/component/versioned_dependency_component'
require 'java_buildpack/container'
require 'java_buildpack/logging/logger_factory'
require 'java_buildpack/util/class_file_utils'
require 'java_buildpack/util/file_enumerable'
require 'java_buildpack/util/groovy_utils'
require 'java_buildpack/util/qualify_path'

require 'pathname'
require 'set'
require 'tmpdir'

module JavaBuildpack
  module Container
    class Consul < JavaBuildpack::Component::ModularComponent
      include JavaBuildpack::Util

      # Creates an instance
      #
      # @param [Hash] context a collection of utilities used the component
      def initialize(context)
        @logger = JavaBuildpack::Logging::LoggerFactory.instance.get_logger Consul
        super(context)
      end

      # (see JavaBuildpack::Component::BaseComponent#compile)
    #  def compile
    #    uri = 'https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip'
    #    download_zip('0.5.2', uri)
    #  end

      def command
        "$PWD/#{(@droplet.sandbox + 'consul agent -server -bootstrap-expect 1 -data-dir /tmp/consul')}"
      end

      def supports?
        true
      end

    end

  end
end
