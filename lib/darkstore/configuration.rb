module Darkstore
  class Configuration
    attr_accessor :token,
                  :sandbox,
                  :endpoint

    def initialize
      @token    = ""
      @sandbox  = true
      @endpoint = "https://www.darkstore.com"
    end
  end
end
