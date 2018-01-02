require 'spec_helper'

RSpec.describe Darkstore::Orders, vcr: true do
  describe "#create" do
    let(:customer_data) do
      {
        first_name: "John",
        last_name: "Doe",
        email: "john.doe@example.com",
        phone: "4159320238"
      }
    end

    let(:order_data) do
      {
        address: "49-29 30th Place",
        apt_suite: "400a",
        city: "New York",
        state: "NY",
        zip: "11101",
        instructions: "Leave the pack in front of the door",
        delivery: "Next Day",
        delivery_carrier: "TForce",
        delivery_service: "SameDay"
      }
    end

    let(:cart_data) { { "TESTSKU1" => 1 } }

    let(:order) do
      {
        customer: customer_data,
        order: order_data,
        product_name: true,
        date: "2017-12-10",
        cart: cart_data
      }
    end

    subject { described_class.new.create(order) }

    it "create order on darkstore" do
      expect(subject.ok?).to be_truthy
      expect(subject.json_response).to be_any
      expect(subject.json_response.first).to include 'id'
    end
  end
end
