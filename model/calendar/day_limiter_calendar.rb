require_relative './calendar'
require_relative './time_range'

class DayLimiterCalendar < Calendar
  def initialize(start_date, stop_date, days)
    @start_date = DateTime.new(start_date.year, start_date.month, start_date.day)
    @stop_date = DateTime.new(stop_date.year, stop_date.month, stop_date.day)
    if  days.size != 7
      raise "Error reading days: #{days}.  It should be formatted: 0111110"
    end
    @days = days
  end

  def events
    unless @events
      @events = []
      date = @start_date
      while date < @stop_date
        @events << TimeRange.new( date, date.next ) if @days[date.wday] == '0'
        date = date.next
      end
    end
    @events
  end
end
