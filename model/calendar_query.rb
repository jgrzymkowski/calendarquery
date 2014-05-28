require_relative './calendar/day_limiter_calendar'

class CalendarQuery
  include CalendarBuilder
  attr_accessor :start_date, :stop_date, :days, :start_time, :stop_time, :calendar_ids

  def initialize( printer, params )
    @printer = printer
    today = Date.today
    @start_date = params[:start_date] || at_beginning_of_day( today )
    @stop_date = params[:stop_date] || @start_date >> 1
    @days = params[:days] || '0000000'
    @start_time = params[:start_time] || '00:00:00'
    @stop_time = params[:stop_time] || '00:00:00'
    @calendar_ids = params[:calendar_ids] || []
  end

  def run
    google_client = GoogleClient.new
    calendars = @calendar_ids.map do |calendar_id|
      calendar_hash = google_client.load_calendars( calendar_id, @start_date, @stop_date )
      calendar_from_google_hash calendar_hash
    end

    calendars << DayLimiterCalendar.new( @start_date, @stop_date, days )
    calendars << TimeLimiterCalendar.new( @start_date, @stop_date, @start_time, @stop_time )
    free_times = FreeFinder.find( @start_date, @stop_date, calendars)
    print_events free_times
  end

  private
  def print_events( free_times )
    unless free_times.empty?
      current_day = at_beginning_of_day( free_times[0].start )
      @printer.print "-- #{print_date( current_day )} --"
    end
    free_times.each do |event|
      if at_beginning_of_day( event.start ) != current_day
        @printer.print ''
        @printer.print "-- #{print_date( at_beginning_of_day( event.start ) )} --"
      end
      @printer.print print_range( event )
      current_day = at_beginning_of_day( event.start )
    end

  end

  def at_beginning_of_day( datetime )
    DateTime.new(datetime.year, datetime.month, datetime.day )
  end

  def print_date( datetime )
    datetime.strftime( '%m/%d/%Y' )
  end

  def print_range( event )
    "#{event.start.strftime( '%I:%M %p' )} to #{event.stop.strftime( '%I:%M %p' )}"
  end
end
