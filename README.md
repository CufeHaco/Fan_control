# Fan_control
a Ruby script for controlling a cooling fan for the RPI
INSTRUCTIONS:

MAKE SURE THAT RUBY IS UPDATED ON YOUR RASPBERRY PI.
sudo apt-get install ruby-full

THIS SCRIPT REQUIRES THE PI_PIPER GEM
sudo gem install pi_piper

AFTER THESE STEPS ARE COMPLETE, DOWNLOAD THE TWO SCRIPTS.

HOW TO RUN SCRIPT AT START

in the CLI or TERMINAL,
sudo nano /etc/rc.local

before the exit(0) line, add

ruby /home/pi/Fan_control/Fan_init.rb &
(I can't rembmeber if ruby is needed, if it doesn't work then just take ruby out of the line.
 Make sure you have the & at the end of the line, it makes the script a background process.)
save and exit.

to change temp or gpio settings of fan control.
cd /home/pi/Fan_control
nano Fan_controller.rb

follow the comments within the script.  it gives detailed instructions on how to modify 
the fan and pin settings.
save and quit.

at default, the fan will turn on when the cpu temp is greater than or equal too 50.0'C
and will turn off when it is less than or equal to 49.9'C

after adding to rc.local and making any changes to Fan_controller.rb,
reboot.  the script will take effect.

Written by Troy Mallory, Feb 7, 2017

