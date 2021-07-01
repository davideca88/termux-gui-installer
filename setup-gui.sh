#!/data/data/com.termux/files/usr/bin/sh

# Script made by Davideca
# Github profile:  <https://github.com/davideca27>
# YouTube Channel: <https://youtube.com/Davideca>
# Made on Termux 0.114 | Bash 5.1.8
# 2021/06/30

# Colors
reset="\e[00m"
red="\e[01;31m"
green="\e[01;32m"
yellow="\e[01;33m"
blue="\e[01;34m"
purple="\e[00;35m"
cyan="\e[00;36m"

# Functions

function xfce {
    pkg install xfce4 -y
    echo "#!/data/data/com.termux/files/usr/bin/sh" > ~/.vnc/xstartup
    echo "xfce4-session &" >> ~/.vnc/xstartup

    echo -e -n "\n$yellow[?]$reset Install recommends?\n\tnetsurf        - webbrowser\n\txfce4-terminal - terminal emulator\n(Y/n): "
        read xresp
   
    if [ $xresp = "y" -o  $xresp = "Y" ]; then
        pkg install xfce4-terminal netsurf -y
    fi
}

function lxqt {
    pkg install lxqt -y
    echo "#!/data/data/com.termux/files/usr/bin/sh" > ~/.vnc/xstartup
    echo "startlxqt &" >> ~/.vnc/xstartup

    echo -e -n "\n$yellow[?]$reset Install recommends?\n\totter-browser - webbrowser\n\tqterminal     - terminal emulator\n(Y/n): "
    read xresp
   
    if [ $xresp = "y" -o  $xresp = "Y" ]; then
        pkg install otter-browser qterminal -y
    fi
}

#function mate {
#    pkg install mate-* marco #-y
#    echo "#!/data/data/com.termux/files/usr/bin/sh" > ~/.vnc/xstartup
#    echo "mate-session &" >> ~/.vnc/xstartup
#
#    echo -e -n "\n$yellow[?]$reset Install recommends?\n\tnetsurf       - webbrowser\n\tmate-terminal - terminal emulator\n(Y/n): "
#        read xresp
#   
#    if [ $xresp = "y" -o  $xresp = "Y" -o -z $xrep  ]; then
#        pkg install netsurf mate-terminal -y
#    fi

#}

function error {
    echo -e "${red}[!]$reset ERROR"
    echo "Something went wrong =("
    echo 'Run "bash install_gui.sh" again'
    exit
}

pkg update -y           # Updating
pkg install x11-repo -y # Enable x11-repo
pkg install tigervnc -y
clear
vncserver -localhost    # Generating passwd of vnc server
vncserver -kill :1      # Stopping vnc server for now
echo 'export DISPLAY=":1"' >> ~/.bashrc # Setting up environment variable
clear

echo -e "${yellow}[?]$reset    What Desktop Environment you want?"
echo
echo -e "      $blue [1] XFCE $reset"
echo -e "      $blue [2] LXQt $reset"
echo -e "      $green [3] MATE (coming soon) $reset"
echo
echo -n "Resp: "        # Choosing the environment 
    read resp

if [ $resp = "1" ]; then

    xfce

elif [ $resp = "2" ]; then

    lxqt

#elif [ $resp = "3" ]; then
#    mate

else 
    error

fi

if !  [ -f ~/.vnc/*.pid ]; then
vncserver -localhost    # Starting vncserver
fi

echo -e "${green}FINISHED INSTALLATION $reset"
echo
echo -e "Run ${green}~/startgui${reset} to open the GUI\nOr go to your VNC Client and set the address: 127.0.0.1:5901"
echo "termux-open vnc://127.0.0.1:5901" > ~/initgui.sh
chmod +x ~/initgui.sh
