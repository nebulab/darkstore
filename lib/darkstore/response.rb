require 'json'

module Darkstore
  class Response
    attr_reader :error_summary, :body, :response

    def initialize(underlying_response: nil, error_summary: nil)
      @response = underlying_response
      @error_summary = error_summary

      load_response if response
    end

    def ok?
      response.status == 200
    end

    private

    def load_response
      @body = JSON.parse(response.body) if ok?
    end
  end
end
