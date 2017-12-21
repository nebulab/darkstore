require "darkstore/version"
require "faraday"
require "faraday_middleware"
require "recursive_open_struct"

require "darkstore/configuration"
require "darkstore/response"
require "darkstore/request"
require "darkstore/utility"
require "darkstore/param_converter"
require "darkstore/api"

module Darkstore
  class << self
    attr_accessor :configuration

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
