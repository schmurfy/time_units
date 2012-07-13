
module TimeDuration
  class << self
    attr_accessor :units
  end
  
  self.units = [
    [1.year,    :years,   "year",   "years"],
    [1.month,   :months,  "month",  "months"],
    [1.week,    :weeks,   "week",   "weeks"],
    [1.day,     :days,    "day",    "days"],
    [1.hour,    :hours,   "hour",   "hours"],
    [1.minute,  :minutes, "min",    "mins"],
    [1,         :seconds, "s",      "s"]
  ]
  
  ##
  # Format a duration for display.
  # 
  # @param [Integer,nil] limit if set this will limit the
  #   number of fields shown (ex: 2 = 2 months 3 weeks)
  # 
  # @return [String] the formatted duration
  # 
  def human_duration(limit = nil)
    diff = Hash.new(0)
    
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
      if diff[unit_name] > 0
        ret << pluralize.(diff[unit_name], unit)
        
        if ret.size == limit
          break
        end
      end
    end
    
    ret.join(' ')
  end
end

Numeric.send(:include, TimeDuration)
