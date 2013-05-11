#require 'spec_helper'

#describe MethodProfiler do
#  describe ".observe" do
#    it "returns a new Profiler instance" do
#      described_class.observe(Petition).should be_an_instance_of described_class::Profiler
#    end
#  end
#end
class Sleeper

  def snooze
    sleep(1)
  end

end

describe "Application 'MethodProfiler'" do
  before do
    @app = UIApplication.sharedApplication
   # @profiler = MethodProfiler::Profiler.new(Sleeper)
  end

  it "has one window" do
    @app.windows.size.should == 1
  end

  it "should profile the class" do
    profiler = MethodProfiler::Profiler.new(Sleeper)

    sleeper = Sleeper.new

    3.times do
      sleeper.snooze
    end

    puts profiler.report
    true.should.be ==  true
  end

  it "should profile the class" do
    sleeper = Sleeper.new
    
    sleeper.snooze
    true.should.be ==  true
  end
end
