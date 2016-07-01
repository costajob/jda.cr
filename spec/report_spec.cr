require "./spec_helper.cr"

describe JDA::Report do
  it "should render results" do
    report = JDA::Report.new("ebuskr.txt", Stubs.rows)
    io = MemoryIO.new
    report.render(io)
    io.rewind
    io.gets_to_end.should eq %(\e[33;1mebuskr.txt\e[0m - matchings: \e[36;1m2\e[0m\n)
  end
end
