module Darkstore
  class Orders < Api
    def post(line_items:, shipping_address:, email: nil, delivery: {}, delivery_instructions: nil)
      request(:post,
              'orders',
              body: {
                line_items: line_items,
                shipping_address: shipping_address,
                email: email,
                delivery: delivery,
                delivery_instructions: delivery_instructions
              })
    end
  end
end
