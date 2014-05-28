require_relative './time_range_builder'

module CalendarBuilder
  include TimeRangeBuilder

  def calendar_from_google_hash( hash )
    items = hash["items"]
    events = items.map { |item| time_range_from_google_hash( item ) }
    Calendar.new events
  end
end
