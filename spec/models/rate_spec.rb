require 'spec_helper'

RSpec.describe Darkstore::Rate, vcr: true do
  describe '#delivery_rates' do
    context "search by product id" do
      subject { described_class.new.delivery_rates(zip: '11101', cart: { '1270' => 1 }) }

      it "returns darkstore rates" do
        expect(subject.ok?).to be_truthy
        expect(subject.body).to include 'rates'
      end
    end

    context "search by sku" do
      subject do
        described_class.new.delivery_rates(
          zip: '11101',
          cart: { 'FB-FBQ0' => 1 },
          product_name: true
        )
      end

      it "returns darkstore rates" do
        expect(subject.ok?).to be_truthy
        expect(subject.body).to include 'rates'
      end
    end
  end
end
