class TimeRange
  attr_accessor :start, :stop

  def initialize(start, stop)
    self.start = start
    self.stop = stop
  end

  def eql?( other )
    self.class == other.class && self.start.eql?(other.start) && self.stop.eql?(other.stop)
  end
  alias_method :==, :eql?


end
