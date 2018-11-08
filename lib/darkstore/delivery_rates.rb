module Darkstore
  class DeliveryRates < Api
    def get(zip:, line_items:)
      request(:get,
              'orders/delivery_rates',
              params: { zip: zip, line_items: line_items.to_json }
      )
    end
  end
end
