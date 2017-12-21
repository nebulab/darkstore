require 'json'

module Darkstore
  class Response
    attr_reader :error_summary, :body, :response

    def initialize(underlying_response: nil, error_summary: nil)
      @response = underlying_response
      @body = underlying_response.body
      @error_summary = error_summary
    end

    def ok?
      response.status == 200
    end

    def json_response
      JSON.parse(body)
    rescue JSON::ParserError
      { error: "parse error" }
    end
  end
end
