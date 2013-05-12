unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'velocity/*.rb')).each do |file|
    app.files.unshift(file)
  end
end

# {MethodProfiler} collects performance information about the methods
# in your objects and creates reports to help you identify slow methods.
#
module Velocity
  # Create a new {MethodProfiler::Profiler} which will observe all method calls
  # on the given object. This is a convenience method and has the same effect
  # as {MethodProfiler::Profiler#initialize}.
  #
  # @param [Object] obj The object to observe.
  # @return [MethodProfiler::Profiler] A new profiler.
  #
  def observe(obj)
    Profiler.new(obj)
  end
 # module_function :observe
end

