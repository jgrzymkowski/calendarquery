require 'spec_helper'

describe TimeLimiterCalendar do

  it 'raises an error with poorly formatted stop or start time' do
    expect{  TimeLimiterCalendar.new( DateTime.new(2014,1,1),
                                   DateTime.new(2014,8,1),
                                   "10:0000",
                                   "14:00:00" )}.to raise_error
    expect{ TimeLimiterCalendar.new( DateTime.new(2014,1,1),
                                   DateTime.new(2014,8,1),
                                   "10:00:00",
                                   "14:0000" )}.to raise_error
  end

  it 'creates events to block time outside specified time range' do
    subject = TimeLimiterCalendar.new( DateTime.new(2014,1,1),
                                   DateTime.new(2014,1,8),
                                   "10:00:00",
                                   "14:00:00" )
    expect( subject.events ).to match_array( [
        TimeRange.new(DateTime.new(2014,1,1,0,0,0), DateTime.new(2014,1,1,10,0,0) ),
        TimeRange.new(DateTime.new(2014,1,1,14,0,0), DateTime.new(2014,1,2,10,0,0) ),
        TimeRange.new(DateTime.new(2014,1,2,14,0,0), DateTime.new(2014,1,3,10,0,0) ),
        TimeRange.new(DateTime.new(2014,1,3,14,0,0), DateTime.new(2014,1,4,10,0,0) ),
        TimeRange.new(DateTime.new(2014,1,4,14,0,0), DateTime.new(2014,1,5,10,0,0) ),
        TimeRange.new(DateTime.new(2014,1,5,14,0,0), DateTime.new(2014,1,6,10,0,0) ),
        TimeRange.new(DateTime.new(2014,1,6,14,0,0), DateTime.new(2014,1,7,10,0,0) ),
        TimeRange.new(DateTime.new(2014,1,7,14,0,0), DateTime.new(2014,1,8,0,0,0) ),
    ] )
  end
end
