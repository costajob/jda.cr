require "./spec_helper.cr"

describe JDA::Filter do
  it "should match provided values" do
    filter = JDA::Filter.new(values: %w(806578069), index: 0_i8)
    filter.match?(Stubs.rows[0]).should be_true
  end

  it "should refute non macthed values" do
    filter = JDA::Filter.new(values: %w(Y), index: 14_i8)
    filter.match?(Stubs.rows[1]).should be_false
  end
end
