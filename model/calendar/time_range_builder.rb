module TimeRangeBuilder
  def time_range_from_google_hash( hash )
    start_s = hash["start"]["dateTime"]
    stop_s = hash["end"]["dateTime"]
    TimeRange.new( DateTime.strptime( start_s ), DateTime.strptime( stop_s ) )
  end
end
