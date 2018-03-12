require 'set'
require 'csv'

class ArtistPairs
  def initialize(input_file, output_file, support_threshold)
    @input_file = input_file
    @output_file = output_file
    @support_threshold = support_threshold
  end

  def to_csv
    CSV.open(@output_file, 'w') do |csv|
      frequent_artist_pairs.each { |pair| csv << pair }
    end
  end

  def frequent_artist_pairs
    artist_pairs = []
    processed_artists = []

    frequent_artist_lines_map.each_key do |artist|
      processed_artists.each do |coinciding_artist|
        if (frequent_artist_lines_map[artist] & frequent_artist_lines_map[coinciding_artist]).count >= @support_threshold
          artist_pairs << Set[artist, coinciding_artist]
        end
      end

      processed_artists << artist
    end

    artist_pairs
  end

  private

  def frequent_artist_lines_map
    @frequent_artist_lines_map ||= artist_lines_map.select { |k,v| v.count >= @support_threshold }
  end

  def artist_lines_map
    map = Hash.new { |h,k| h[k] = [] }

    File.foreach(@input_file).with_index do |line, i|
      line.split(',').each do |artist|
        map[artist] = map[artist] << i
      end
    end

    map
  end
end
