require 'spec_helper'

describe FreeFinder do

  describe '#find' do
    let( :start ) { Time.new(2014,04,25,0,0,0) }
    let( :stop ) { Time.new(2014,04,25,23,59,59) }
    let( :calendar1 ) do
      events = [ TimeRange.new( Time.new(2014,4,25,9,0,0), Time.new(2014,04,25,12,0,0) ),
                 TimeRange.new( Time.new(2014,4,25,16,0,0), Time.new(2014,04,25,17,0,0) ) ]
      Calendar.new events
    end
    let( :calendar2 ) do
      events = [ TimeRange.new( Time.new(2014,04,24,9,0,0), Time.new(2014,4,25,17,0,0) ) ]
      Calendar.new events
    end
    let( :calendar3 ) do
      events = [ TimeRange.new( Time.new(2014,04,25,9,0,0), Time.new(2014,4,25,10,0,0) ),
                 TimeRange.new( Time.new(2014,04,25,10,0,0), Time.new(2014,4,25,11,0,0) ),
                 TimeRange.new( Time.new(2014,04,25,10,0,0), Time.new(2014,4,25,12,0,0) ),
                 TimeRange.new( Time.new(2014,04,25,17,0,0), Time.new(2014,4,26,0,0,0) ) ]
      Calendar.new events
    end
    let( :calendar4 ) do
      Calendar.new []
    end

    context 'One calendar' do
      it 'returns the inverse of event times' do
        free_times = FreeFinder.find( start, stop, [calendar1] )
        expect(free_times).to eql( [ TimeRange.new( Time.new(2014,04,25,0,0,0), Time.new(2014,4,25,9,0,0)),
                                     TimeRange.new( Time.new(2014,04,25,12,0,0), Time.new(2014,4,25,16,0,0)),
                                     TimeRange.new( Time.new(2014,04,25,17,0,0), Time.new(2014,4,25,23,59,59)) ] )
      end
    end

    context 'Two Calendars' do
      it 'returns free time case 1' do
        free_times = FreeFinder.find( start, stop, [calendar1, calendar2] )
        expect(free_times).to eql( [ TimeRange.new( Time.new(2014,04,25,17,0,0), Time.new(2014,4,25,23,59,59)) ])
      end

      it 'returns free time case 2' do
        free_times = FreeFinder.find( start, stop, [calendar1, calendar3] )
        expect(free_times).to eql( [ TimeRange.new( Time.new(2014,04,25,0,0,0), Time.new(2014,4,25,9,0,0)),
                                     TimeRange.new( Time.new(2014,04,25,12,0,0), Time.new(2014,4,25,16,0,0)) ])
      end

      it 'returns free time case 3' do
        free_times = FreeFinder.find( start, stop, [calendar1, calendar4] )
        expect(free_times).to eql( [ TimeRange.new( Time.new(2014,04,25,0,0,0), Time.new(2014,4,25,9,0,0)),
                                     TimeRange.new( Time.new(2014,04,25,12,0,0), Time.new(2014,4,25,16,0,0)),
                                     TimeRange.new( Time.new(2014,04,25,17,0,0), Time.new(2014,4,25,23,59,59)) ] )
      end
    end

    context 'Four Calendars' do
      it 'returns free times' do
        free_times = FreeFinder.find( start, stop, [calendar1, calendar2, calendar3, calendar4] )
        expect(free_times).to be_empty
      end

    end

  end
end
