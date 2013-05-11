module Benchmark

  def realtime
    r0 = Time.now
    yield
    Time.now - r0
  end
  
  module_function :realtime
end
