
module TimeDuration
  class << self
    attr_accessor :units
  end
  
  self.units = [
    [1.week,    :weeks,   "week", "weeks"],
    [1.day,     :days,    "day", 'days'],
    [1.hour,    :hours,   "hour", "hours"],
    [1.minute,  :minutes, "min", "mins"],
    [1,         :seconds, "s", "s"]
  ]
  
  def human_duration
    diff = {
      :weeks    => 0,
      :days     => 0,
      :hours    => 0,
      :minutes  => 0,
      :seconds  => 0
    }
    
    ret = []
    
    pluralize = proc do |count, arr|
      unit = (count == 1) ?  arr[2] : arr[3]      
      "#{count} #{unit}"
    end
    
    t = self.to_i
      
    while t > 0
      TimeDuration.units.each do |(limit, field)|
        if t >= limit
          diff[field] += 1
          t -= limit
          break
        end
      end
      
    end
    
    ret = []
    
    TimeDuration.units.each.with_index do |unit|
      unit_name = unit[1]
      ret << pluralize.(diff[unit_name], unit)     if diff[unit_name] > 0
    end
    
    ret.join(' ')
  end
end

Numeric.send(:include, TimeDuration)
