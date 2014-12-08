module Timing
  include Anticipate
  
  def soon
    sleeping(0.2).seconds.between_tries.failing_after(50).tries do
      yield
    end
  end
  
  def eventually
    sleeping(2).seconds.between_tries.failing_after(5).tries do
      yield
    end
  end
end
World Timing