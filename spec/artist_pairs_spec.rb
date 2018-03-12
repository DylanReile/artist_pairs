require_relative '../artist_pairs'
require 'rspec'
require 'fakefs/spec_helpers'

describe ArtistPairs do
  include FakeFS::SpecHelpers

  def stub_input_file
    File.open('input.txt', 'w') do |f|
      f.puts("Radiohead,Pulp,Morrissey,Delays,Stereophonics,Blur,Suede,Sleeper,The La's,Super Furry Animals,Iggy Pop")
      f.puts("Band of Horses,Smashing Pumpkins,The Velvet Underground,Radiohead,The Decemberists,Morrissey,Television")
    end
  end

  describe '#frequent_artist_pairs' do
    it 'returns the artist pairs appearing together at least support_threshold number of times' do
      stub_input_file

      expect(described_class.new('input.txt', 'output.csv', 2).frequent_artist_pairs).to eq([
        Set['Radiohead', 'Morrissey']
      ])
    end
  end
end
