describe "Velocity" do
  before do
    @app = UIApplication.sharedApplication
  end
  it "should profile the class" do
    profiler = Velocity::Profiler.new(Lion)

    lion = Lion.new
    lion.hunt
    lion.eat
    lion.zzz

    puts profiler.report
    true.should.be ==  true
  end
end
