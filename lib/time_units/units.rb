
module TimeUnits 
  def seconds() self end
  def minutes() 60 * seconds end
  def hours()   60 * minutes end
  def days()    24 * hours end
  def weeks()   7 * days end
  def months()  4* weeks end
  def years()   365 * days end
  
  def ago; Time.now - seconds; end
  def from_now; Time.now + seconds; end
  
  instance_methods.select{|m| m !~ /__/}.each do |plural|
    singular = plural.to_s.chop
    alias_method singular, plural
  end
end

Numeric.send(:include, TimeUnits)