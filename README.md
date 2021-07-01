# Termux GUI installer

This is a simple script with the purpose of helping novice (or lazy) user of Termux to have a graphical user interface.
Most of the steps followed in this script are on [Termux Wiki](https://wiki.termux.com/wiki/Main_Page) about [Graphical Environment](https://wiki.termux.com/wiki/Graphical_Environment).  The script is focused on Desktop Environment, being them:
- XFCE
- LXQt
- Mate (coming soon)

Which are the Desktop Environments available on x11-repo. This script download the GUI vanilla, to customize, just follow tutorials on how to customize the interface that you choose.

### Requirements:
- Termux
- Android 7.0 or higher
- VNC Client (I recommend VNC Viewer)

## How to install?
```bash
# Update your repositories
pkg update -y

# Install wget
pkg install wget -y

# Download the script on your home (~)
wget https://raw.githubusercontent.com/davideca27/termux-gui-installer/master/setup-gui.sh ~

# Run the script
bash setup-gui.sh

# To open the client (from Termux)
~/initgui.sh
```

In part of the installation you will see something like:
```
You will require a password to access your desktops.

Password:
Verify:
Would you like to enter a view-only password (y/n)? n
```
In this part you will set a password to access the VNC Server. Is a password with 8 or more characters, it will not be visible as you type. After that it will ask if you want to use a view-only password, say "n". After this you will see:
```
[?]    What Desktop Environment you want?

       [1] XFCE
       [2] LXQt
       [3] MATE (coming soon)

Resp:
```
For now you can choose XFCE and LXQt (i'm still trying to make the MATE work lmao). <br><br>
After a lot of time, it will ask if you want install recommended packages (terminal emulator and a web browser), as the name says, it's recommended to install. <br><br>
And finally, if everything went well, the installation was finished. To open the GUI you could use the script "initgui.sh" that was generated in your $HOME, or manually configure the Desktop inside your VNC Client. I hope you enjoy!!
