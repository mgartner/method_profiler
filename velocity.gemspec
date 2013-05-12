# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = "velocity"
  s.version     = "0.0.1"
  s.authors     = ["Marcus Garter"]
  s.email       = ["magartner@gmail.com"]
  s.homepage    = "https://github.com/mgarter/velocity"
  s.summary     = %q{Velocity - the measurement of motion.}
  s.description = %q{Velocity is a method profiler for RubyMotion.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
