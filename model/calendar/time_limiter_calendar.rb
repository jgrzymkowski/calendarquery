class TimeLimiterCalendar < Calendar

  def initialize(start_date, stop_date, start_time, stop_time)
    @start_date = start_date
    @stop_date = stop_date
    @start_time = start_time.split(':').map( &:to_i )
    @stop_time = stop_time.split(':').map( &:to_i )
    if @start_time.size != 3
      raise "Error reading start time: #{start_time}.  It should be formatted: 12:15:00"
    end
    if @stop_time.size != 3
      raise "Error reading stop time: #{stop_time}.  It should be formatted: 12:15:00"
    end
  end

  def events
    unless @events
      @events = []
      date = @start_date
      start = @start_date
      while( date < @stop_date )
        stop = DateTime.new( date.year,
                             date.month,
                             date.day,
                             @start_time[0],
                             @start_time[1],
                             @start_time[2] )
        @events << TimeRange.new( start, stop )
        start = DateTime.new( date.year,
                              date.month,
                              date.day,
                              @stop_time[0],
                              @stop_time[1],
                              @stop_time[2] )
        date = date.next
      end
      stop = @stop_date
      @events << TimeRange.new( start, stop )
    end
    @events
  end

end
