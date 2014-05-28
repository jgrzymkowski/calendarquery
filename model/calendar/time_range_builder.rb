module TimeRangeBuilder
  def time_range_from_google_hash( hash )
    if hash['start']['dateTime']
      start_s = hash['start']['dateTime']
    else
      start_s = "#{hash['start']['date']}T00:00:00#{Time.now.to_datetime.zone}"
    end
    if hash['end']['dateTime']
      stop_s = hash['end']['dateTime']
    else
      stop_s = "#{hash['end']['date']}T00:00:00#{Time.now.to_datetime.zone}"
    end
    TimeRange.new( DateTime.strptime( start_s ), DateTime.strptime( stop_s ) )
  end
end
