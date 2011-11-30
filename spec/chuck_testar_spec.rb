require 'spec_helper'

describe ChuckTestar do
  let(:output)    { StringIO.new }
  let(:formatter) { ChuckTestar.new(output) }

  before do
    formatter.stub(:delay => true)
  end

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
      formatter.stub(:notify_with_voice! => true)
      formatter.stop
      output.string.should =~ /p/
    end
  end

  describe "notifications" do
    before do
      formatter.stub(:say => true)
    end

    if ChuckTesta::Portable::osx? && defined?(GrowlNotify)
      it "display growl success notification when spec pass" do
        formatter.example_passed(example)
        GrowlNotify.should_receive(:normal).with(:title => 'RSpec', :description => 'Your tests pass', :icon => formatter.icon('chuck-normal.png'))
        formatter.stop
      end

      it "display growl success and fail notifications when spec fail" do
        formatter.example_failed(example)
        GrowlNotify.should_receive(:normal).with(:title => 'RSpec', :description => 'Your tests pass', :icon => formatter.icon('chuck-normal.png'))
        GrowlNotify.should_receive(:normal).with(:title => 'RSpec', :description => "Nope! It's just Chuck Testa!", :icon => formatter.icon('chuck-nope.png'))
        formatter.stop
      end
    end
  end
end
