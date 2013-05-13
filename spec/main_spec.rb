describe "Velocity" do
  before do
    @app = UIApplication.sharedApplication
  end
  it "should profile the class" do
    profiler = MotionProfiler.observe(Lion)

    lion = Lion.new
    lion.hunt
    lion.eat
    lion.zzz

    puts profiler.report
    true.should.be ==  true
  end
end
