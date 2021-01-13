require "spec_helper"
require "musicz/request"

# spec dependencies only
require "musicz/configuration"

RSpec.describe Musicz::Request do
  let(:config) do
    Musicz::Configuration.new.tap do |c|
      c.app_name = "Musicz Tests"
      c.contact = "github.com/derrickp/musicz"
    end
  end

  let(:request) { described_class.new(config: config) }

  describe "#get" do
    subject { request.get(endpoint: endpoint, parameters: params) }
    let(:params) { {} }
    let(:endpoint) { "artist/5b11f4ce-a62d-471e-81fc-a69a8278c7da" }

    it "calls Typhoeus with the right parameters" do
      VCR.use_cassette("basic_request") do
        expect(subject.success?).to eq(true)
      end
    end

    context "sends along the parameters" do
      let(:params) do
        {
          fmt: "json",
          query: "Slipknot"
        }
      end
      let(:endpoint) { "artist" }

      it "responds with a success" do
        VCR.use_cassette("basic_json_request") do
          expect(subject.success?).to eq(true)
        end
      end

      it "responds with a JSON body" do
        VCR.use_cassette("basic_json_request") do
          expect(JSON.parse(subject.body)).to be_a(Hash)
        end
      end
    end
  end
end
