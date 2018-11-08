require 'json'

module Darkstore
  class Response
    attr_reader :error_summary, :body, :response

    def initialize(underlying_response: nil, error_summary: nil)
      @response = underlying_response
      @body = @response&.body
      @error_summary = error_summary

      handle_error_summary
    end

    def ok?
      !response.nil? && response.status.between?(200, 206)
    end

    def json_response
      JSON.parse(body)
    rescue JSON::ParserError
      { error: "parse error" }
    end

    private

    def handle_error_summary
      return if ok?

      if error_summary.nil? 
        @error_summary = json_response["message"]
      else
        @body = { message: error_summary }.to_json
      end
    end
  end
end
