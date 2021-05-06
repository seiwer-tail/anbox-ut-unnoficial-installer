#!/bin/bash
echo "Hello! This is the Anbox setup wizard for officially unsupported Ubuntu Touch devices"
echo " "
read -p "press enter to continue " start


echo " "
echo " "
echo "ATTENTION!"
echo "Installing Anbox on officially unsupported devices is not recommended"
echo "If you still want to do this, please take into account that Anbox may contain bugs and (or) it will be impossible to use it."
echo " "
echo " "
read -p "press enter to continue " start

echo " "
echo " "
echo " "
echo "Warning: To install Anbox, your system must have an Anbox support patch, this patch only allows "
echo "installation if you have a patch but the anbox installer does not support your device"
echo " "
echo " "
read -p "press enter to continue " start
echo " "
echo " "
echo " "
echo "What would you like to do?"
echo "i - Install Anbox "
echo "q - What problems can I face after installation "
echo "e - exit "
echo " "
echo " "
read -p "answer: " menu
case $menu in
i) echo " Preparatory work will be done now. The system will now ask for a password to install the screenfetch and android-tools package"
   echo " "
   read -p "Press enter to start preparation" prepare
   exec sudo mount -o remount, rw /
   exec sudo apt install -y screenfetch anbox-ubuntu-touch  android-tools-adb
   exec cd /home/phablet/ 
   exec mkdir /home/phablet/anbox-data
   echo "Excellent! Let us ask a couple of questions before starting the installation to start the installation"
   echo "Don't worry, the questions will be easy" 
   read -p "[enter]"
   exec screenfetch -n
   echo "Please select the architecture of your processor (you can find it now in the Kernel column in the system information that was displayed above"
   read -p "[aarch64 | armhf] " arhitecture
   case $arhitecture in
   aarch64)  echo " Are you ready to install?"
             read -p "[y / n] " installing
             case $installing in
             y)  exec wget http://cdimage.ubports.com/anbox-images/android-armhf-64binder.img -O /home/phablet/anbox-data/android.img
                exec touch /home/phablet/anbox-data/.enable
                exec sudo start -q anbox-container
                echo "You need to reboot your system to complete the installation"
                echo "Reboot?"
                read -p "[y / n]" reboot
                case $reboot in
                y ) echo "Thanks for installing"
                   echo "The script was made by Seiwer-Tail"
                   read -p "Press Enter to reboot"
                   exec reboot;;
             n ) echo "Sorry, this is the end.";; 
             esac;;
             n ) echo "Sorry, this is the end.";;
             esac;;
 armhf) echo " Are you ready to install?"
        read -p "[y / n] " installing
        case $installing in
             y) exec wget http://cdimage.ubports.com/anbox-images/android-armhf-32binder.img -O /home/phablet/anbox-data/android.img
                exec touch /home/phablet/anbox-data/.enable
                exec sudo start -q anbox-container
                echo "You need to reboot your system to complete the installation"
                echo "Reboot?"
                read -p "[y / n]" yesno
                case $yesno in
                y) echo "Thanks for installing"
                   echo "The script was made by Seiwer-Tail"
                   read -p "Press Enter to reboot"
                   exec reboot;;
                n) echo "Sorry, this is the end.";;
                esac;;
             n) echo "Sorry, this is the end."
             esac;;
esac;;



q) echo "It's good that you asked that! Most likely, you will encounter the unstable work of Anbox, as well as incompatibility of some APIs (for example, when accessing the camera, Anbox may crash), lack of hardware acceleration. There may be no internet connection. Most of the application may crash"
   echo " "
   echo " "
   read -p "Press enter to return to the main menu " returned
   echo " "
   echo " "
   echo " Since the author first wrote a script in bash himself, he cannot implement a return to the main menu, so the script will be closed now and you will need to start it again. sorry"
   echo " "
   echo " "
   read -p "Press Enter to close the script" exited
   return 0;;

e) echo "Goodbye $USER";;

esac