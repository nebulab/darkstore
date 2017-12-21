module Darkstore
  class Rate < Api
    def delivery_rates(darkstore_id: nil, zip:, cart:)
      params = {}

      params[:darkstore_id] = darkstore_id unless darkstore_id.nil?
      params[:order] = { zip: zip } unless zip.nil?
      params[:cart] = cart unless cart.nil?

      request(:get, 'delivery_rates', params: params)
    end
  end
end
