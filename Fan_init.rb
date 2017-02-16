#!/usr/bin/env ruby

#---------------------------------------------------
#This script starts the fan driver as a super user.
#change the path dir to match yours, by default it
#should be /home/pi/Fan_control/Fan_controller.rb"
#to have this driver working when the RPI boots,
#sudo nano /etc/rc.local
#add this before the exit(0) line in rc.local
#ruby /home/pi/Fan_control/Fan_init.rb &
#save and exit, then reboot.
#---------------------------------------------------
system "sudo ruby /home/pi/Fan_control/Fan_controller.rb"
sleep(1)
exit(0)
