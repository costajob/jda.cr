require "./spec_helper"

describe JDA::Feed do
  it "should return feed directory patterns" do
    JDA::Feed.ext_pattern.should eq "*{.txt}"
  end

  it "should raise an error for missing source" do
    expect_raises(JDA::Feed::NoSrcError) { JDA::Feed.new(nil) }
  end

  it "should parse CSV data" do
    src = File.expand_path("../../samples/ebuskr.txt", __FILE__)
    feed = JDA::Feed.new(src)
    skus = [] of String
    feed.each_row do |row|
      skus << row[0]
    end
    skus.size.should eq 30
    skus[0].strip.should eq "804017365"
  end

  it "should return base name" do
    src = File.expand_path("../../samples/ebuskr.txt", __FILE__)
    feed = JDA::Feed.new(src)
    feed.name.should eq "ebuskr.txt"
  end
end
