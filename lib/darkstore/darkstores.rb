module Darkstore
  class Darkstores < Api
    def get
      request(:get, 'darkstores')
    end
  end
end
