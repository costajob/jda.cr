require "./spec_helper.cr"

describe JDA::Scanner do
  it "should collect results by sku filter" do
    filters = [] of JDA::Filters::Base
    filters << JDA::Filters::Sku.new(%w(804511615 806732962))
    scanner = JDA::Scanner.new(filters)
    scanner.call
    scanner.results["ebuskr.txt"].size.should eq 3
  end

  it "should collect results by store filter" do
    filters = [] of JDA::Filters::Base
    filters << JDA::Filters::Store.new(%w(25008 25005))
    scanner = JDA::Scanner.new(filters)
    scanner.call
    scanner.results["ebuskr.txt"].size.should eq 7
  end

  it "should collect results by sale filter" do
    filters = [] of JDA::Filters::Base
    filters << JDA::Filters::Sale.new
    scanner = JDA::Scanner.new(filters)
    scanner.call
    scanner.results["ebuskr.txt"].size.should eq 2
  end


  it "should collect results by combining filters" do
    filters = [] of JDA::Filters::Base
    filters << JDA::Filters::Sku.new(%w(804511615 806732962))
    filters << JDA::Filters::Store.new(%w(25008 25005))
    filters << JDA::Filters::Sale.new
    scanner = JDA::Scanner.new(filters)
    scanner.call
    scanner.results["ebuskr.txt"].size.should eq 1
  end
end
