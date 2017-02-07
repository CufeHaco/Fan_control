#!/usr/bin/env ruby

require 'pi_piper'
#------------------------------------------------------------------------------
#$fan controls the gpio pin.  :pin relates to the GPIO number,
#not physical pin number.  GPIO 18 is physical pin 12.
#direction tells the pin to work as a input or output. :in(input), :out(output)
#------------------------------------------------------------------------------
$fan = PiPiper::Pin.new(:pin => 18, :direction => :out)

#-----------------------------------------------------------------------------
#define's cpu_temp variable.  calls a procedure to run the system command
#-----------------------------------------------------------------------------
def cpu_temp
a = proc{`vcgencmd measure_temp`}
a.call
end

#-----------------------------------------------------------------------------
#sets conditions of when cooling fan turns on and off
#-----------------------------------------------------------------------------
def check_temp
a = proc{
			if cpu_temp >= "temp=50.0'C" #only change the numbers for changing the temp. greater than or equal to
				$fan.on #turn fan gpio pin on
				end
			if cpu_temp <= 'temp=49.0'C" #only change the numbers for changing the temp. less than or equal to
				$fan.off #turn fan gpio pin off
				end
										 }
#----------------------------------------------------------------------------
#starts temp monitoring										 
#----------------------------------------------------------------------------
b = proc{
			loop do
			 a.call   # calls the a proc of check_temp
			 sleep(5) # how many seconds the script waits before starting the loop again
			 end
						}
b.call	#calls the b proc of check temp					
end

#-----------------------------------------------------------------------------
#starts the check_temp process
check_temp
