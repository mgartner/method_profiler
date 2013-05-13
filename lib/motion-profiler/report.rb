# Add a convenience method to float for coverting from seconds to
# milliseconds.
class Float
  def to_ms
    "%.3f ms" % (self * 1000)
  end
end

module MotionProfiler

  # Sorts and displays data collected by a Profiler.
  class Report

    # Fields that can be passed to #sort_by.
    FIELDS = [:method, :min, :max, :average, :total_time, :total_calls]

    # Directions that can be passed to #order.
    DIRECTIONS = [:asc, :desc,]

    # Initializes a new Report.
    def initialize(data, name)
      @data = data
      @name = name
      @sort_by = :average
      @order = :descending
    end

    # Sorts the report by the given field. Defaults to `:average`.
    # Chainable with #order.
    def sort_by(field)
      field = field.to_sym
      field = :average unless FIELDS.include?(field)
      @sort_by = field
      self
    end

    # Changes the direction of the sort. Defaults to `:desc`.
    # Chainable with #sort_by.
    def order(direction)
      direction = direction.to_sym
      direction = :desc unless DIRECTIONS.include?(direction)
      @order = direction
      self
    end

    # Sorts the data by order and sort_by and returns an array.
    def to_a
      if @order == :asc
        @data.sort { |a, b| a[@sort_by] <=> b[@sort_by] }
      else
        @data.sort { |a, b| b[@sort_by] <=> a[@sort_by] }
      end
    end

    # Returns a printable string of the sorted data.
    def to_s
      string = "\nVelocity results for: #{@name}\n".light_blue
      self.to_a.each do |method_data|
        string += "-- #{method_data.shift[1]}\n".red
        method_data.each_pair do |metric, time|
          if time.is_a?(Float)
            time = time.to_ms
          end
          string += "  #{metric}: #{time}\n"
        end
      end
      return string
    end

  end
end
