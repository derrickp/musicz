require 'spec_helper'
require 'musicz/search/artist_repository'

# Spec only dependencies
require 'musicz/request'
require 'musicz/configuration'
require 'musicz/search/options/id_search'

RSpec.describe Musicz::Search::ArtistRepository do
  let(:request) do
    config = Musicz::Configuration.build_default
    Musicz::Request.new(config: config)
  end

  let(:repo) { described_class.new(request: request) }

  describe '#by_id' do
    subject { repo.by_id(id_options) }
    let(:id_options) do
      Musicz::Search::Options::IdSearch.new(
        id: 'a466c2a2-6517-42fb-a160-1087c3bafd9f'
      )
    end

    it 'returns the right Artist entity' do
      VCR.use_cassette('artist_id_search') do
        expect(subject.id).to eq(id_options.id)
        expect(subject.sort_name).to eq('Slipknot')
      end
    end

    context 'given an invalid id' do
      let(:id_options) do
        Musicz::Search::Options::IdSearch.new(
          id: 'ggf-6517-42fb-a160-1087c3bafd9f'
        )
      end

      it 'returns an error response' do
        VCR.use_cassette('invalid_id_artist_search') do
          expect(subject.error).to eq('Invalid mbid.')
        end
      end
    end
  end

  describe '#by_term' do
    subject { repo.by_term(term) }

    let(:term) { 'Slipknot' }

    it 'should return an ArtistList' do
      VCR.use_cassette('artist_term_search') do
        expect(subject).to be_a(Musicz::Entities::ArtistList)
      end
    end
  end
end
