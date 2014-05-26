class FreeFinder
  def self.find( start, stop, calendars )
    all_events = calendars.reduce([]) do |events, c|
      events += c.events
    end

    all_events.sort! do |a, b|
      a.start <=> b.start
    end

    free_times = []
    next_free_start = start
    all_events.each do |event|
      if event.start <= next_free_start
        next_free_start = [next_free_start, event.stop].max
      else
        free_times << TimeRange.new(next_free_start, event.start)
        next_free_start = event.stop
      end
    end

    if next_free_start < stop
      free_times << TimeRange.new(next_free_start, stop)
    end
    free_times
  end

end
