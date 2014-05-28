require 'spec_helper'

describe DateUtil do
  class DummyDateUtil; include DateUtil; end
  subject { DummyDateUtil.new }

  describe '#at_beginning_of_day' do
    it 'returns the same date at the beginning of the day (midnight)' do
      d = DateTime.new(2012,12,25,15,30)
      expect( subject.at_beginning_of_day d ).to eql( DateTime.new(2012,12,25,0,0) )

      d = DateTime.new(2015,1,1,5,1,1,"+05:00")
      expect( subject.at_beginning_of_day d ).to eql( DateTime.new(2015,1,1,0,0,0,"+05:00") )

      d = DateTime.new(2015,1,1,0,0,0,"+05:00")
      expect( subject.at_beginning_of_day d ).to eql( DateTime.new(2015,1,1,0,0,0,"+05:00") )
    end
  end
end
