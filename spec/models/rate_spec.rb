require 'spec_helper'

RSpec.describe Darkstore::Rate, vcr: true do
  describe '#delivery_rates' do
    subject { described_class.new.delivery_rates(zip: '02108', cart: { '1270' => 1 }) }

    it "returns darkstore rates" do
      expect(subject.ok?).to be_truthy
      expect(subject.body).to include 'rates'
    end
  end
end
