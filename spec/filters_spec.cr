require "./spec_helper.cr"

describe JDA::Filters do
  it "should match row by sku" do
    filter = JDA::Filters::Sku.new(values: %w(806578069 806578067))
    filter.match?(Stubs.rows[0]).should be_true
  end

  it "should match row by sale value" do
    filter = JDA::Filters::Sale.new
    filter.match?(Stubs.rows[0]).should be_true
  end

  it "should match row by store" do
    filter = JDA::Filters::Store.new(values: %w(25005 25001) )
    filter.match?(Stubs.rows[0]).should be_true
  end

  it "should return false for unmatched values" do
    filter = JDA::Filters::Sale.new
    filter.match?(Stubs.rows[1]).should be_false
  end
end
