require 'spec_helper'

RSpec.describe Darkstore::Response do
  describe "#initialize" do
    let(:params) { { underlying_response: underlying_response, error_summary: error_summary } }

    subject { described_class.new(params) }

    before do
      allow_any_instance_of(described_class).to receive(:ok?).and_return(ok?)
    end

    context 'when underlying_response is defined' do
      let(:ok?) { true }
      let(:underlying_response) { double('Response', body: body) }
      let(:body) { { code: 'CODE', message: 'MESSAGE' }.to_json }
      let(:error_summary) { nil }

      it "sets the correct response and body" do
        expect(subject.response).to eq(underlying_response)
        expect(subject.body).to eq(body)
      end

      context 'when there is no error' do
        it "sets the correct error_summary" do
          expect(subject.error_summary).to eq(error_summary)
        end
      end

      context 'when there is error' do
        let(:ok?) { false }

        it "sets the correct error_summary" do
          expect(subject.error_summary).to eq('MESSAGE')
        end
      end
    end

    context 'when error_summary is defined' do
      let(:underlying_response) { nil }
      let(:body) { {message: error_summary}.to_json }
      let(:error_summary) { 'ERROR SUMMARY' }
      let(:ok?) { false }

      it "sets the correct body" do
        expect(subject.body).to eq(body)
      end
    end
  end

  describe "#ok?" do
    subject { described_class.new.ok? }

    before do
      allow_any_instance_of(described_class).to receive(:handle_error_summary)
      allow_any_instance_of(described_class).to receive(:response).and_return(response)
    end

    context 'when response is not defined' do
      let(:response) { nil }

      it { is_expected.to be_falsey }
    end

    context 'when response is defined' do
      let(:response) { double('Response', status: status) }

      context 'when status is between 200 and 206' do
        let(:status) { 200 }

        it { is_expected.to be_truthy }
      end

      context 'when status is not between 200 and 206' do
        let(:status) { 500 }

        it { is_expected.to be_falsey }
      end
    end
  end
end
