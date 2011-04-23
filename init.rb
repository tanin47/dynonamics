require 'dynonamics_client'
require 'dynohook'
require 'workerhook'


class Exception
  def to_s_with_trace
    "#{self.class}: #{self.to_s}\n" + self.backtrace.map{|e|e+"\n"}.join('')
  end

end