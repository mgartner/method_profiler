module Velocity

  # Velocity::Profiler collects execution time of method calls of an object.
  class Profiler

    # Initializes a new Profiler to observe the given object.
    def initialize(obj)
      @obj = obj
      @data = Hash.new { |h, k| h[k] = [] }

      wrap_methods_with_profiling(self)
    end

    # Returns a report of the profile data collected on the object.
    def report
      Report.new(final_data, @obj.name)
    end

    private

    # Wraps all the methods of @obj to calculate exectuion time.
    def wrap_methods_with_profiling(profiler)
      [
        { object: @obj.singleton_class, methods: @obj.methods(false), private: false, singleton: true },
        { object: @obj, methods: @obj.instance_methods(false), private: false },
        { object: @obj, methods: @obj.private_instance_methods(false), private: true }
      ].each do |group|
        group[:object].module_eval do
          group[:methods].each do |method|
            define_method("#{method}_with_profiling") do |*args, &block|
              profiler.send(:profile, method, singleton: group[:singleton]) do
                send("#{method}_without_profiling", *args, &block)
              end
            end

            alias_method "#{method}_without_profiling", method
            alias_method method, "#{method}_with_profiling"
          end
        end
      end
    end

    # Profiles the block and records the elapsed time.
    def profile(method, options = {}, &block)
      method_name = options[:singleton] ? ".#{method}" : "##{method}"
      elapsed_time, result = benchmark(block)
      @data[method_name] << elapsed_time
      result
    end

    # Returns the elapsed time taken for block_to_benchmark.
    def benchmark(block_to_benchmark)
      result = nil
      t0 = Time.now
      result = block_to_benchmark.call
      return Time.now - t0, result
    end

    # Compiles the collected data into several useful catagories.
    def final_data
      results = []

      @data.each do |method, records|
        total_calls = records.size
        total_time = records.reduce(:+)
        average = total_time / total_calls
        results << {
          method: method,
          min: records.min,
          max: records.max,
          average: average,
          total_time: total_time,
          total_calls: total_calls,
        }
      end

      results
    end

  end
end
