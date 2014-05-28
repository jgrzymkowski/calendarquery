require 'spec_helper'

describe TimeRangeBuilder do
  class DummyBuilder; include TimeRangeBuilder; end
  subject { DummyBuilder.new }

  let( :google_hash_time ) do
    {
      "kind"=>"calendar#event",
      "etag"=>"\"lALbFE98s88NEFGE7rntyxNtHBY/MjgwMjI4MDc4NTI2NDAwMA\"",
      "id"=>"66mjtmfbbkmdcggbbjleuhvb00",
      "status"=>"confirmed",
      "htmlLink"=>"https://www.google.com/calendar/event?eid=NjZtanRtZmJia21kY2dnYmJqbGV1aHZiMDAgZW8zcnJnYTN2YXI2Z2FwM3Jzbjdkb2c4ZzhAZw",
      "created"=>"2014-05-26T21:39:52.000Z",
      "updated"=>"2014-05-26T21:39:52.632Z",
      "summary"=>"Dinner",
      "creator"=>{
        "email"=>"jeremygrzymkowski@gmail.com",
        "displayName"=>"Jeremy Grzymkowski"
      },
      "organizer"=>{
        "email"=>"eo3rrga3var6gap3rsn7dog8g8@group.calendar.google.com",
        "displayName"=>"Test 1",
        "self"=>true
      },
      "start"=>{
        "dateTime"=>"2014-06-20T20:00:00-05:00"
      },
      "end"=>{
        "dateTime"=>"2014-06-20T22:00:00-05:00"
      },
      "iCalUID"=>"66mjtmfbbkmdcggbbjleuhvb00@google.com",
      "sequence"=>0
    }
  end
  let( :google_hash_date ) do
    {
      "kind"=>"calendar#event",
      "etag"=>"\"lALbFE98s88NEFGE7rntyxNtHBY/MjgwMjI4MDc4NTI2NDAwMA\"",
      "id"=>"66mjtmfbbkmdcggbbjleuhvb00",
      "status"=>"confirmed",
      "htmlLink"=>"https://www.google.com/calendar/event?eid=NjZtanRtZmJia21kY2dnYmJqbGV1aHZiMDAgZW8zcnJnYTN2YXI2Z2FwM3Jzbjdkb2c4ZzhAZw",
      "created"=>"2014-05-26T21:39:52.000Z",
      "updated"=>"2014-05-26T21:39:52.632Z",
      "summary"=>"Dinner",
      "creator"=>{
        "email"=>"jeremygrzymkowski@gmail.com",
        "displayName"=>"Jeremy Grzymkowski"
      },
      "organizer"=>{
        "email"=>"eo3rrga3var6gap3rsn7dog8g8@group.calendar.google.com",
        "displayName"=>"Test 1",
        "self"=>true
      },
      "start"=>{"date"=>"2014-06-01"},
      "end"=>{"date"=>"2014-06-08"},
      "iCalUID"=>"66mjtmfbbkmdcggbbjleuhvb00@google.com",
      "sequence"=>0
    }
  end
  let( :zone ) { Time.now.to_datetime.zone }

  describe '#from_google_hash' do
    it 'returns a TimeRange' do
      expect( subject.time_range_from_google_hash google_hash_time ).to be_instance_of TimeRange
    end

    context 'dates with times' do
    it 'populates start and end dates' do
      time_range = subject.time_range_from_google_hash google_hash_time
      expect( time_range.start ).to eql( DateTime.strptime "2014-06-20T20:00:00-05:00" )
      expect( time_range.stop ).to eql( DateTime.strptime "2014-06-20T22:00:00-05:00" )
    end
    end

    context 'dates with no times' do
      it 'populates the start and end dates with midnight as the time' do
      time_range = subject.time_range_from_google_hash google_hash_date
      expect( time_range.start ).to eql( DateTime.strptime "2014-06-01T00:00:00#{zone}" )
      expect( time_range.stop ).to eql( DateTime.strptime "2014-06-08T00:00:00#{zone}" )
      end
    end
  end

end
