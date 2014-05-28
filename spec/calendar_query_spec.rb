require 'spec_helper'

describe CalendarQuery do
  let( :printer ) { double( :printer, { print: nil } ) }
  before :each do
    stub_const( 'Date', Class.new )
    allow(Date).to receive( :today ).and_return DateTime.new(2014,1,1)
  end

  describe '#initialize' do
    it 'has defaults' do
      query = CalendarQuery.new( printer, {} )
      expect( query.start_date ).to eql( DateTime.new(2014,1,1) )
      expect( query.stop_date ).to eql( DateTime.new(2014,2,1) )
      expect( query.days ).to eql( '1111111' )
      expect( query.start_time ).to eql( '00:00:00' )
      expect( query.stop_time ).to eql( '00:00:00' )
      expect( query.calendar_ids ).to eql( [] )
    end
  end

  subject { CalendarQuery.new( printer, {
    start_date: DateTime.new(2014,6,1),
    stop_date: DateTime.new(2014,7,1),
    days: '0111110',
    start_time: '09:00:00',
    stop_time: '12:00:00',
    calendar_ids: ['abc123', 'xyz789']

  } ) }
  describe '#run' do
    let( :google_client ) { double( :google_client, { load_calendars: {} } ) }

    before :each do
      stub_const( 'GoogleClient', Class.new )
      allow( GoogleClient ).to receive(:new).and_return google_client
    end

    it 'loads calendars from google' do
      expect( google_client ).to receive( :load_calendars ).
          with( 'abc123', DateTime.new(2014,6,1), DateTime.new(2014,7,1) ).and_return( {} )
      expect( google_client ).to receive( :load_calendars ).
          with( 'xyz789', DateTime.new(2014,6,1), DateTime.new(2014,7,1) ).and_return( {} )
      subject.run
    end

    it 'creates a day limiter' do
      expect( DayLimiterCalendar ).to receive( :new ).and_return( Calendar.new( [] ) )
      subject.run
    end

    it 'creates a time limiter' do
      expect( TimeLimiterCalendar ).to receive( :new ).and_return( Calendar.new( [] ) )
      subject.run
    end

    it 'finds free times' do
      expect( FreeFinder ).to receive( :find ).and_return []
      subject.run
    end
  end
end
