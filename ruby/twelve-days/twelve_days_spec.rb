require_relative 'twelve_days.rb'

RSpec.describe TwelveDaysTest do
  it "returns the full song correctly and formatted" do
    file_path = File.expand_path("song.txt", __dir__)
    song_from_file = File.read(file_path)
    expect(TwelveDaysTest.song).to eq(song_from_file)
  end
end