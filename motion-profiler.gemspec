Gem::Specification.new do |s|
  s.name        = "motion-profiler"
  s.version     = "0.0.1"
  s.authors     = ["Marcus Garter"]
  s.email       = ["magartner@gmail.com"]
  s.homepage    = "https://github.com/mgarter/motion-profiler"
  s.summary     = %q{A profiler for RubyMotion.}
  s.description = %q{A profiler for RubyMotion based on method_profiler.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'motion-colorize'
end
