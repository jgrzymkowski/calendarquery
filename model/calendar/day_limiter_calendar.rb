require_relative './calendar'
require_relative './time_range'
require_relative '../util/date_util'

class DayLimiterCalendar < Calendar
  include DateUtil

  def initialize(start_date, stop_date, days)
    @start_date = at_beginning_of_day( start_date )
    @stop_date = at_beginning_of_day( stop_date )
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
