require "./spec_helper.cr"

describe JDA::Scanner do
  it "should collect results by sku filter" do
    filters = [] of JDA::Filters::Base
    filters << JDA::Filters::Sku.new(%w(804511615 806732962 800907730))
    scanner = JDA::Scanner.new(filters)
    scanner.call
    scanner.results["ebuskr.txt"].size.should eq 3
    scanner.results["ebuspf1.txt"].size.should eq 2
  end

  it "should collect results by store filter" do
    filters = [] of JDA::Filters::Base
    filters << JDA::Filters::Store.new(%w(25008 25005 23017))
    scanner = JDA::Scanner.new(filters)
    scanner.call
    scanner.results["ebuskr.txt"].size.should eq 7
    scanner.results["ebuspf1.txt"].size.should eq 3
  end

  it "should collect results by sale filter" do
    filters = [] of JDA::Filters::Base
    filters << JDA::Filters::Sale.new
    scanner = JDA::Scanner.new(filters)
    scanner.call
    scanner.results["ebuskr.txt"].size.should eq 2
    scanner.results["ebuspf1.txt"].size.should eq 1
  end


  it "should collect results by combining filters" do
    filters = [] of JDA::Filters::Base
    filters << JDA::Filters::Sku.new(%w(804511615 806732962 800907730))
    filters << JDA::Filters::Store.new(%w(25008 25005 23017))
    filters << JDA::Filters::Sale.new
    scanner = JDA::Scanner.new(filters)
    scanner.call
    scanner.results["ebuskr.txt"].size.should eq 1
    scanner.results["ebuspf1.txt"].size.should eq 1
  end
end
