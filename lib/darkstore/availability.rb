module Darkstore
  class Availability < Api
    def skus(zip:)
      request(:get, 'skus', params: { zip: zip })
    end
  end
end
