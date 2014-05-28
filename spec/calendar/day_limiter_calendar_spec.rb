require 'spec_helper'

describe DayLimiterCalendar do

  it 'raises an error with an badly formatted days string' do
    expect{ DayLimiterCalendar.new( DateTime.new(2014,1,1), DateTime.new(2014,1,30), '000' ) }.to raise_error
    expect{ DayLimiterCalendar.new( DateTime.new(2014,1,1), DateTime.new(2014,1,30), '001111110' ) }.to raise_error
    expect{ DayLimiterCalendar.new( DateTime.new(2014,1,1), DateTime.new(2014,1,30), '' ) }.to raise_error
  end

  it 'blocks out times for days not specified' do
    calendar = DayLimiterCalendar.new( DateTime.new(2014,1,1), DateTime.new(2014,2,1), '0000000')
    expect( calendar.events.size ).to eql( 31 )
    calendar = DayLimiterCalendar.new( DateTime.new(2014,1,1), DateTime.new(2014,1,30), '0111110')
    expect( calendar.events ).to match_array( [
        TimeRange.new( DateTime.new(2014,1,4), DateTime.new(2014,1,5) ),
        TimeRange.new( DateTime.new(2014,1,5), DateTime.new(2014,1,6) ),
        TimeRange.new( DateTime.new(2014,1,11), DateTime.new(2014,1,12) ),
        TimeRange.new( DateTime.new(2014,1,12), DateTime.new(2014,1,13) ),
        TimeRange.new( DateTime.new(2014,1,18), DateTime.new(2014,1,19) ),
        TimeRange.new( DateTime.new(2014,1,19), DateTime.new(2014,1,20) ),
        TimeRange.new( DateTime.new(2014,1,25), DateTime.new(2014,1,26) ),
        TimeRange.new( DateTime.new(2014,1,26), DateTime.new(2014,1,27) )
    ] )
  end
end
