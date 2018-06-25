module Darkstore
  class Inventory < Api
    def get(zip: nil, skus: nil, darkstore_id: nil, brands_ids: nil)
      request(:get, 'inventory',
              params: {
                zip: zip,
                skus: skus,
                darkstore_id: darkstore_id,
                brands_ids: brands_ids
              })
    end
  end
end
