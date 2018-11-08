module Darkstore
  class Inventory < Api
    def get(zip: nil, sku_ids: nil, darkstore_ids: nil, brand_ids: nil)
      request(:get, 'inventory',
              params: {
                zip: zip,
                sku_ids: sku_ids,
                darkstore_ids: darkstore_ids,
                brand_ids: brand_ids
              })
    end
  end
end
