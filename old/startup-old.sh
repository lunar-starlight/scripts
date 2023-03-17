#pulseaudio -D
sudo su -c 'echo 128 > /proc/sys/vm/nr_hugepages'
sudo sysctl -w vm.nr_hugepages=128
xinput set-prop 9 'libinput Accel Profile Enabled' 0, 1
xinput set-prop 9 'libinput Accel Speed' 1
redshift -l 46.056946:14.505751 -t 3400:2700 -b 1:1 &
sudo razerd &
razercfg -c Scrollwheel:020204
razercfg -m GlowingLogo:static
razercfg -c GlowingLogo:0a0208
