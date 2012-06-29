require_relative '../spec_helper'

describe 'TimeDuration' do
  should 'works' do
    min1 = 60
    hour1 = 60*min1
    day1 = 24*hour1
    
    12.human_duration.should == "12 s"
    60.human_duration.should == "1 min"
    120.human_duration.should == "2 mins"
    124.human_duration.should == "2 mins 4 s"
    
    (20*min1 + 36).human_duration.should == "20 mins 36 s"
    
    (2*hour1).human_duration.should == "2 hours"
    
    (2*day1 + 21*hour1 + 3).human_duration.should == "2 days 21 hours 3 s"
    
    (2.weeks + 36.hours).human_duration.should == "2 weeks 1 day 12 hours"
  end
end
