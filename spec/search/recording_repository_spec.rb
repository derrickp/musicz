require "spec_helper"
require "musicz/search/recording_repository"

# Spec only dependencies
require "musicz/request"
require "musicz/configuration"
require "musicz/search/options/id_search"
require "musicz/search/options/recording_query_terms"

RSpec.describe Musicz::Search::RecordingRepository do
  let(:request) do
    config = Musicz::Configuration.build_default
    Musicz::Request.new(config: config)
  end

  let(:repo) { described_class.new(request: request) }

  describe "#by_id" do
    subject { repo.by_id(id_options) }
    let(:id_options) do
      Musicz::Search::Options::IdSearch.new(
        id: "4cd3d49b-8fe7-4cb2-bbb4-e40545239d79"
      )
    end

    it "returns the right Recording entity" do
      VCR.use_cassette("recording_id_search") do
        expect(subject.id).to eq(id_options.id)
        expect(subject.title).to eq("Prelude")
      end
    end

    context "given an invalid id" do
      let(:id_options) do
        Musicz::Search::Options::IdSearch.new(
          id: "ggf-6517-42fb-a160-1087c3bafd9f"
        )
      end

      it "returns an error response" do
        VCR.use_cassette("invalid_id_recording_search") do
          expect(subject.error).to eq("Invalid mbid.")
        end
      end
    end

    context "given some relationships" do
      let(:id_options) do
        Musicz::Search::Options::IdSearch.new(
          id: "4cd3d49b-8fe7-4cb2-bbb4-e40545239d79",
          relationships: ["releases"]
        )
      end

      it "returns the related entities" do
        VCR.use_cassette("recording_id_search_with_relationships") do
          expect(subject.releases.empty?).to be(false)
        end
      end

      context "given invalid relationships" do
        let(:id_options) do
          Musicz::Search::Options::IdSearch.new(
            id: "4cd3d49b-8fe7-4cb2-bbb4-e40545239d79",
            relationships: ["pizza"]
          )
        end

        it "returns an error response" do
          VCR.use_cassette("recording_id_seach_invalid_relationships") do
            expect(subject.error).to eq(
              "#{id_options.relationships.first} is not a valid inc parameter for the recording resource."
            )
          end
        end
      end
    end
  end

  describe "#by_term" do
    subject { repo.by_term(term) }

    let(:term) { "Slipknot" }

    it "should return an RecordingList" do
      VCR.use_cassette("recording_term_search") do
        expect(subject).to be_a(Musicz::Entities::RecordingList)
      end
    end
  end

  describe "#by_query" do
    subject { repo.by_query(query_terms) }

    let(:query_terms) do
      Musicz::Search::Options::RecordingQueryTerms.new(
        artist: '"The Sword"',
        title: "Prelude"
      )
    end

    it "should return an RecordingList" do
      VCR.use_cassette("recording_query_terms_search") do
        expect(subject).to be_a(Musicz::Entities::RecordingList)
      end
    end

    it "returns a result that has a score" do
      VCR.use_cassette("recording_query_terms_search") do
        expect(subject.recordings.first.score).to eq(100)
      end
    end
  end
end
