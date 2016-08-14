#!/bin/bash
#Fedora Install Tool v0.1
# Made by Dr. Waldijk
#A script to install various repos & software
#Read the README.md for more info
# -----------------------------------------------------------------------------------
while :
do
    clear
    echo "Fedora Install Tool v0.1"
    echo ""
    echo "1. Install Resilio BTsync     |  2. Install Powerline"
    echo "3. Install RPM Fusion         |  4. Install Broadcom Wireless"
    echo "0. Quit"
    echo ""
    read -p "Enter option: " -s -n1 FITOPT
    case "$FITOPT" in
        1)
            if [ -e /bin/btsync ]
            then
                clear
                echo "You already have Resilio BTsync installed."
                read -p "Press (the infamous) any key to continue... " -n1 -s
            else
                clear
                echo "Starting install..."
                sudo echo -e "[btsync]\nname=BitTorrent Sync $basearch\nbaseurl=http://linux-packages.getsync.com/btsync/rpm/$basearch\nenabled=1\ngpgcheck=1" > /etc/yum.repos.d/btsync.repo
                sudo rpm --import http://linux-packages.getsync.com/btsync/key.asc
                sudo dnf -y install btsync
                echo -e "alias startbtsync='systemctl --user start btsync.service'\nalias stopbtsync='systemctl --user stop btsync.service'\nalias statusbtsync='systemctl --user status btsync.service'\nalias enablebtsync='systemctl --user enable btsync.service'\nalias disablebtsync='systemctl --user disable btsync.service'" >> ~/.bashrc
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
            fi
        ;;
        2)
            if [ -e /bin/powerline ]
            then
                clear
                echo "You already have Powerline installed."
                read -p "Press (the infamous) any key to continue... " -n1 -s
            else
                clear
                echo "Starting install..."
                sudo dnf -y install powerline
                echo -e "if [ -f `which powerline-daemon` ]; then\n  powerline-daemon -q\n  POWERLINE_BASH_CONTINUATION=1\n  POWERLINE_BASH_SELECT=1\n  . /usr/share/powerline/bash/powerline.sh\nfi" >> ~/.bashrc
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
            fi
        ;;
        3)
            if [ -e /etc/yum.repos.d/rpmfusion-free.repo ]
            then
                clear
                echo "You already have RPM Fusion repo installed."
                read -p "Press (the infamous) any key to continue... " -n1 -s
            else
                clear
                echo "Starting install..."
                sudo dnf -y install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
            fi
        ;;
        4)
            if [ -e /usr/src/akmods/wl-kmod*.rpm ]
            then
                clear
                echo "You already have Broadcom Wireless drivers installed."
                read -p "Press (the infamous) any key to continue... " -n1 -s
            else
                clear
                echo "Starting install..."
                sudo dnf -y akmod-wl kmod-wl broadcom-wl kernel-devel
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
            fi
        ;;
        0)
            clear
            echo "Fedora Install Tool v0.1"
            echo "Bye!"
            break
        ;;
        *)
            clear
            echo "Wrong option!"
            read -p "Press (the infamous) any key to continue... " -n1 -s
        ;;
    esac
done
