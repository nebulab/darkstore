module Darkstore
  class Auth < Api
    def login(email:, password:)
      request(:post, 'login', body: { email: email, password: password })
    end
  end
end
