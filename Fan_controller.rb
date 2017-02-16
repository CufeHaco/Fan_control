#!/usr/bin/env ruby
#-----------------------------------------------------------
#Fan Driver for adding a cooling fan to a Raspberry Pi.
#requires Ruby ( should be compatable with 1.9.2 but update
#to 2.3.1 to be safe.)
#This script requires the rpi_gpio gem.
#This Script was Written by Troy B. Mallory on 02-15-2017.
#Version 2.0
#-----------------------------------------------------------
require 'rpi_gpio'
#-----------------------------------------------------------
#to change the gpio pin being used, change the number on
#RPi::gpio.setup pin#,
#by default the set_numbering :board relates to the physical
#pin number.  To gpio pin number change :board to :bcm.
#under bcm physical pin 12 would be gpio 18
#-----------------------------------------------------------
RPi::GPIO.set_numbering :board
RPi::GPIO.setup 12, as: :output
#-----------------------------------------------------------
#cpu_temp this defined variable is the method of checking
#the cpu temp.
#-----------------------------------------------------------
	def cpu_temp
		`vcgencmd measure_temp`.chomp
	end
#-----------------------------------------------------------	
#check_temp: this method is to set the cpu temp that turns
#the fan on and off.  to change this setting, edit the
#number in "temp=00.0'C"
#-----------------------------------------------------------
	def check_temp
		if cpu_temp >= "temp=50.0'C"
			RPi::GPIO.set_high 12
			end
		if cpu_temp <= "temp=49.9'C"
			RPi::GPIO.set_low 12
			end
	end
#-----------------------------------------------------------
#This loop method runs the check_temp.  to change the timing
#of the driver to check the cpu temp change the number in
#sleep(#).  this will tell the loop to wait in seconds.
#-----------------------------------------------------------
		
		loop do
		check_temp
		sleep(1)
		end

