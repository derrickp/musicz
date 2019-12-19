require 'spec_helper'
require 'musicz/search/area_repository'

# Spec only dependencies
require 'musicz/request'
require 'musicz/configuration'
require 'musicz/search/options/id_search'

RSpec.describe Musicz::Search::AreaRepository do
  let(:request) do
    config = Musicz::Configuration.build_default
    Musicz::Request.new(config: config)
  end

  let(:repo) { described_class.new(request: request) }

  describe '#by_id' do
    subject { repo.by_id(id_options) }
    let(:id_options) do
      Musicz::Search::Options::IdSearch.new(
        id: 'c5446ccc-24aa-4110-8130-38c97b5d83da'
      )
    end

    it 'returns the right Artist entity' do
      VCR.use_cassette('area_id_search') do
        expect(subject.id).to eq(id_options.id)
        expect(subject.sort_name).to eq('Victoria')
      end
    end

    context 'given an invalid id' do
      let(:id_options) do
        Musicz::Search::Options::IdSearch.new(
          id: 'ggf-6517-42fb-a160-1087c3bafd9f'
        )
      end

      it 'returns an error response' do
        VCR.use_cassette('invalid_id_area_search') do
          expect(subject.error).to eq('Invalid mbid.')
        end
      end
    end

    context 'given some relationships' do
      let(:id_options) do
        Musicz::Search::Options::IdSearch.new(
          id: 'c5446ccc-24aa-4110-8130-38c97b5d83da',
          relationships: ['area-rels']
        )
      end

      it 'returns the related entities' do
        VCR.use_cassette('area_id_search_with_relationships') do
          expect(subject.relations.empty?).to be(false)
        end
      end

      context 'given invalid relationships' do
        let(:id_options) do
          Musicz::Search::Options::IdSearch.new(
            id: 'c5446ccc-24aa-4110-8130-38c97b5d83da',
            relationships: ['pizza']
          )
        end

        it 'returns an error response' do
          VCR.use_cassette('area_id_seach_invalid_relationships') do
            expect(subject.error).to eq(
              "#{id_options.relationships.first} is not a valid inc parameter for the area resource."
            )
          end
        end
      end
    end
  end
end
