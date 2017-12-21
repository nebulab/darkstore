require 'spec_helper'

RSpec.describe Darkstore::Availability, vcr: true do
  describe "#skus" do
    subject { described_class.new.skus(zip: "10001") }

    it "returns darkstore rates" do
      expect(subject.ok?).to be_truthy
      expect(subject.json_response).to be_any
      expect(subject.json_response.first).to include 'id'
    end

    context "when zip have not sku related" do
      subject { described_class.new.skus(zip: "99999") }

      it "returns darkstore rates" do
        expect(subject.response.status).to eq 404
        expect(subject.ok?).to be_falsey
      end
    end
  end
end
