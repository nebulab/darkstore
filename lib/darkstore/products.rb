module Darkstore
  class Products < Api
    def get
      request(:get, 'products')
    end
  end
end
