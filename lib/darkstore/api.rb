module Darkstore
  class Api
    def request(method, path, body: {}, params: {})
      Request.send(method: method, path: full_path(path), body: body, params: params)
    end

    private

    def parse_json(params)
      params.transform_values(&:to_json)
    end

    def api_version
      '/v1'
    end

    def full_path(path)
      "#{api_version}/api/#{path}"
    end
  end
end
