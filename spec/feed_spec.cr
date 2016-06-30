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
    feed.read
    feed.data[0][9].strip.should eq "247205FWCZG"
  end

  it "should return base name" do
    src = File.expand_path("../../samples/ebuskr.txt", __FILE__)
    feed = JDA::Feed.new(src)
    feed.name.should eq "ebuskr.txt"
  end
end
