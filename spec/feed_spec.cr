require "./spec_helper"

describe JDA::Feed do
  it "should raise an error for missing source" do
    expect_raises(JDA::Feed::NoSrcError) { JDA::Feed.new(nil) }
  end

  it "should raise an error for invalid extension" do
    expect_raises(JDA::Feed::InvalidExtError) { JDA::Feed.new("./feed.png") }
  end

  it "should parse CSV data" do
    src = File.expand_path("../../samples/ebuskr.txt", __FILE__)
    feed = JDA::Feed.new(src)
    feed.read
    feed.data[0][9].strip.should eq "247205FWCZG"
  end
end
