module Darkstore
  class Orders < Api
    def create(customer:, order:, product_name:, date:, cart:)
      request(:post,
              'customer_order',
              body: {
                customer: customer,
                order: order,
                product_name: product_name,
                date: date,
                cart: cart
              })
    end
  end
end
