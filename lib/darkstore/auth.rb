module Darkstore
  class Auth < Api
    def login(email:, password:)
      params = {
        sandbox: Darkstore.configuration.sandbox,
        email: email,
        password: password
      }

      request(:post, 'login', body: params)
    end
  end
end
