# Helper class used for testing.
class Lion

  # TODO: Figure out why this breaks the profiler.
  # def initialize(name)
  #   @name = name
  # end

  def zzz(sec = 1)
    sleep(sec)
  end

  def eat(n = 100)
    privately do
      100.times do
        rand + rand
      end
    end
  end

  def hunt(n = 100)
    n.times do
      rand ** rand ** rand
    end
  end

  private

  def privately(&block)
    block.call
  end
end
