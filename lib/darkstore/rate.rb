module Darkstore
  class Rate < Api
    def delivery_rates(darkstore_id: nil, zip:, cart:, product_name: nil)
      params = {}

      params[:darkstore_id] = darkstore_id unless darkstore_id.nil?
      params[:order] = { zip: zip } unless zip.nil?
      params[:cart] = cart unless cart.nil?
      params[:product_name] = true if product_name == true

      request(:get, 'delivery_rates', params: parse_json(params))
    end
  end
end
