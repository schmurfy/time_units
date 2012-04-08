require_relative '../spec_helper'

describe 'TimeUnits' do
  should 'works' do
    1.second.should == 1
    60.seconds.should == 60
    120.seconds.should == 120
    
    1.minute.should == 60
    1.minutes.should == 60
    
    1.hour.should == 60*60
    2.hours.should == 60*60*2
    
    1.days.should == 60*60*24
    2.days.should == 60*60*24*2
    
    1.week.should == 60*60*24*7
    3.week.should == 60*60*24*7*3
    
    1.month.should == 4.weeks
    2.month.should == 8.weeks
    
    1.year.should == 365.days
    2.year.should == 365.days * 2
  end
end
