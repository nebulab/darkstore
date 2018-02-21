require 'json'

module Darkstore
  class Response
    attr_reader :error_summary, :body, :response

    def initialize(underlying_response: nil, error_summary: nil)
      @response = underlying_response

      @error_summary = error_summary
      @body = if error_summary.nil?
                underlying_response.body
              else
                { error: error_summary }.to_json
              end
    end

    def ok?
      !response.nil? && response.status == 200
    end

    def json_response
      JSON.parse(body)
    rescue JSON::ParserError
      { error: "parse error" }
    end
  end
end
