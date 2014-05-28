require 'spec_helper'

describe CalendarBuilder do
  class DummyBuilder; include CalendarBuilder; end
  subject { DummyBuilder.new }

  let( :google_hash ) do
    {
      "kind"=>"calendar#events",
      "etag"=>"\"lALbFE98s88NEFGE7rntyxNtHBY/aRb9-WSuNP5_N28_pm1-3PKOhYo\"",
      "summary"=>"Test 1",
      "description"=>"",
      "updated"=>"2014-05-28T01:42:52.037Z",
      "timeZone"=>"America/Chicago",
      "accessRole"=>"reader",
      "nextSyncToken"=>"CPDD-fvTyr4CEAAYAQ==",
      "items"=>[
        {
          "kind"=>"calendar#event",
          "etag"=>"\"lALbFE98s88NEFGE7rntyxNtHBY/MjgwMjI4MDY0NTkxMjAwMA\"",
          "id"=>"rido90fauaf1oj29vkdhat6nb0",
          "status"=>"confirmed",
          "htmlLink"=>"https://www.google.com/calendar/event?eid=cmlkbzkwZmF1YWYxb2oyOXZrZGhhdDZuYjAgZW8zcnJnYTN2YXI2Z2FwM3Jzbjdkb2c4ZzhAZw",
          "created"=>"2014-05-26T21:38:42.000Z",
          "updated"=>"2014-05-26T21:38:42.956Z",
          "summary"=>"Barbecue",
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
            "dateTime"=>"2014-06-07T13:00:00-05:00"
          },
          "end"=>{
            "dateTime"=>"2014-06-07T18:00:00-05:00"
          },
          "iCalUID"=>"rido90fauaf1oj29vkdhat6nb0@google.com",
          "sequence"=>0
        },
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
        },
        {
          "kind"=>"calendar#event",
          "etag"=>"\"lALbFE98s88NEFGE7rntyxNtHBY/MjgwMjI4MTkxMzUyMDAwMA\"",
          "id"=>"rav3qv94srpusrhshqlat4l9ls",
          "status"=>"confirmed",
          "htmlLink"=>"https://www.google.com/calendar/event?eid=cmF2M3F2OTRzcnB1c3Joc2hxbGF0NGw5bHNfMjAxNDA2MDJUMjIwMDAwWiBlbzNycmdhM3ZhcjZnYXAzcnNuN2RvZzhnOEBn",
          "created"=>"2014-05-26T21:37:27.000Z",
          "updated"=>"2014-05-26T21:49:16.760Z",
          "summary"=>"Yoga",
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
            "dateTime"=>"2014-06-02T17:00:00-05:00",
            "timeZone"=>"America/Chicago"
          },
          "end"=>{
            "dateTime"=>"2014-06-02T18:00:00-05:00",
            "timeZone"=>"America/Chicago"
          },
          "recurrence"=>[
            "RRULE:FREQ=WEEKLY;BYDAY=MO,WE"
          ],
          "transparency"=>"transparent",
          "iCalUID"=>"rav3qv94srpusrhshqlat4l9ls@google.com",
          "sequence"=>4
        },
        {
          "kind"=>"calendar#event",
          "etag"=>"\"lALbFE98s88NEFGE7rntyxNtHBY/MjgwMjI4MTkyOTc1MDAwMA\"",
          "id"=>"6hhepvmh950cnqhhobe7bg25cg",
          "status"=>"confirmed",
          "htmlLink"=>"https://www.google.com/calendar/event?eid=NmhoZXB2bWg5NTBjbnFoaG9iZTdiZzI1Y2cgZW8zcnJnYTN2YXI2Z2FwM3Jzbjdkb2c4ZzhAZw",
          "created"=>"2014-05-26T21:40:15.000Z",
          "updated"=>"2014-05-26T21:49:24.875Z",
          "summary"=>"Play",
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
            "dateTime"=>"2014-06-13T19:00:00-05:00"
          },
          "end"=>{
            "dateTime"=>"2014-06-13T23:00:00-05:00"
          },
          "iCalUID"=>"6hhepvmh950cnqhhobe7bg25cg@google.com",
          "sequence"=>1
        }
      ]
    }
  end

  describe '#from_google_hash' do
    it 'returns a calendar' do
      expect( subject.calendar_from_google_hash google_hash ).to be_instance_of Calendar
    end

    it 'the calendar has a array of TimeRange' do
      calendar = subject.calendar_from_google_hash google_hash
      expect( calendar.events ).to be_instance_of( Array )
      expect( calendar.events.size ).to eql( 4 )
      (0...4).each do |i|
        expect( calendar.events[i] ).to be_instance_of( TimeRange )
      end
    end
  end

end
