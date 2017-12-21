require 'spec_helper'

RSpec.describe Darkstore::Auth, vcr: true do
  subject { described_class.new.login(email: email, password: password) }

  describe '#login' do
    context "with valid credentials" do
      let(:email)    { "user@darkstore.com" }
      let(:password) { "password" }

      it "returns darkstore token" do
        expect(subject.ok?).to be_truthy
        expect(subject.body).to include "darkstoreToken"
      end
    end

    context "with invalid credentials" do
      let(:email)    { "invalid@darkstore.com" }
      let(:password) { "invalid" }

      it "returns error" do
        expect(subject.ok?).to be_falsey
      end
    end
  end
end
