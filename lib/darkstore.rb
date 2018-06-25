require "darkstore/version"
require "faraday"
require "faraday_middleware"
require "recursive_open_struct"

require "darkstore/configuration"
require "darkstore/response"
require "darkstore/request"
require "darkstore/api"
require "darkstore/inventory"
require "darkstore/orders"
require "darkstore/products"
require "darkstore/delivery_rates"

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
