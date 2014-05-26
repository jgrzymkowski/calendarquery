class Calendar
  attr_accessor :events

  def initialize(events)
    self.events = events
  end

  def eql?(other)
    self.class.eql?( other.class ) && self.events.eql?( other.events )
  end
end
