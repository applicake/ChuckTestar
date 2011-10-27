require 'spec_helper'

describe ChuckTestrFormatter do
  let(:output)    { StringIO.new }
  let(:formatter) { ChuckTestrFormatter.new(output) }

  describe "output" do
    let(:example) {
      double("example 1",
       :execution_result => {:status => 'failed', :exception => Exception.new }
      )
    }

    it "displays 'Y' at the start of the suite" do
      formatter.start(1)
      output.string.should =~ /Y/
    end

    it "displays 'e' when examples pass" do
      formatter.example_passed(example)
      output.string.should =~ /e/
    end

    it "displays 'e' when examples fails" do
      formatter.example_failed(example)
      output.string.should =~ /e/
    end

    it "displays 'p' at the end of tests suite" do
      formatter.stub(:notify! => true, :delay => true)
      formatter.stop
      output.string.should =~ /p/
    end
  end
end
