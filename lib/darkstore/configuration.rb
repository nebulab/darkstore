module Darkstore
  class Configuration
    attr_accessor :token,
                  :endpoint

    def initialize
      @token    = ""
      @endpoint = "https://www.darkstore.com/v1/api/"
    end
  end
end
