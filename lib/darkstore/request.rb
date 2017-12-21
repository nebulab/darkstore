module Darkstore
  class Request
    def self.send(**args)
      new(**args).send
    end

    attr_reader :method, :path, :params, :body

    def initialize(method: :get, path: '', params: {}, body: {})
      @method = method
      @path = path
      @params = params
      @body = body

      @connection = build_connection
    end

    def send
      Response.new(underlying_response: make_request)
    rescue Faraday::ConnectionFailed
      Response.new(error_summary: 'Unable to connect to Darkstore')
    rescue Faraday::TimeoutError
      Response.new(error_summary: 'Darkstore connection timeout')
    end

    private

    def build_connection
      Faraday.new(url: base_url) do |connection|
        connection.authorization :Bearer, token
        connection.request(:json)
        connection.request(:url_encoded)

        connection.adapter(Faraday.default_adapter)
      end
    end

    def make_request
      @connection.public_send(@method, path) do |request|
        request.params = params unless params.empty?
        request.body = body unless body.empty?
      end
    end

    def base_url
      Darkstore.configuration.endpoint.chomp("/")
    end

    def token
      Darkstore.configuration.token
    end
  end
end
