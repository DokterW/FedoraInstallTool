#!/bin/bash
# Fedora Install Tool v0.5
# Made by Dr. Waldijk
# A script to install various repos & software
# Read the README.md for more info
# By running this script you agree to the license terms.
# -----------------------------------------------------------------------------------
FITVER=$(echo "0.5")
while :
do
    clear
    echo "Fedora Install Tool v$FITVER"
    echo ""
    echo "1. Install Resilio Sync  |  2. Install Powerline"
    echo "3. Install RPM Fusion    |  4. Install Broadcom Wireless"
    echo "5. Install audio codecs  |  6. Instal VLC"
    echo "7. Install MC            |  8. Instal VIM"
    echo "9. Install nmap"
    echo ""
    echo "Q. Quit"
    echo ""
    read -p "Enter option: " -s -n1 FITOPT
    case "$FITOPT" in
        1)
            if [ -e /etc/yum.repos.d/resilio-sync.repo ]; then
                clear
                echo "You already have Resilio BTsync installed."
                read -p "Press (the infamous) any key to continue... " -n1 -s
            else
                clear
                echo "Starting install..."
                echo -e "[rslsync]\nname=Resilio Sync \$basearch\nbaseurl=http://linux-packages.getsync.com/resilio-sync/rpm/\$basearch\nenabled=1\ngpgcheck=1" > resilio-sync.repo
                sudo mv resilio-sync.repo /etc/yum.repos.d/
                sudo rpm --import https://linux-packages.getsync.com/resilio-sync/key.asc
                sudo dnf -y install resilio-sync
                echo -e "alias startrslsync='systemctl --user start resilio-sync'\nalias stoprslsync='systemctl --user stop resilio-sync'\nalias statusrslsync='systemctl --user status resilio-sync'\nalias enablerslsync='systemctl --user enable resilio-sync'\nalias disablerslsync='systemctl --user disable resilio-sync'" >> ~/.bashrc
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
            fi
        ;;
        2)
            if [ -e /bin/powerline ]; then
                clear
                echo "You already have Powerline installed."
                read -p "Press (the infamous) any key to continue... " -n1 -s
            else
                clear
                echo "Starting install..."
                sudo dnf -y install powerline
                echo -e "if [ -f `which powerline-daemon` ]; then\n  powerline-daemon -q\n  POWERLINE_BASH_CONTINUATION=1\n  POWERLINE_BASH_SELECT=1\n  . /usr/share/powerline/bash/powerline.sh\nfi" >> ~/.bashrc
                su -c 'echo -e "if [ -f `which powerline-daemon` ]; then\n  powerline-daemon -q\n  POWERLINE_BASH_CONTINUATION=1\n  POWERLINE_BASH_SELECT=1\n  . /usr/share/powerline/bash/powerline.sh\nfi" >> /root/.bashrc'
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
            fi
        ;;
        3)
            if [ -e /etc/yum.repos.d/rpmfusion-free.repo ]; then
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
            if [ -e /usr/src/akmods/wl-kmod*.rpm ]; then
                clear
                echo "You already have Broadcom Wireless drivers installed."
                read -p "Press (the infamous) any key to continue... " -n1 -s
            else
                clear
                echo "Starting install..."
                sudo dnf -y install akmod-wl kmod-wl broadcom-wl kernel-devel
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
            fi
        ;;
        5)
#             if [ -e /usr/src/akmods/wl-kmod*.rpm ]
#            then
#                clear
#                echo "You already have Broadcom Wireless drivers installed."
#                read -p "Press (the infamous) any key to continue... " -n1 -s
#            else
                clear
                echo "Starting install..."
                sudo dnf -y install gstreamer-plugins-base gstreamer-plugins-good gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-plugins-good-extras gstreamer-plugins-bad-free gstreamer-plugins-bad-nonfree gstreamer-plugins-bad-free-extras gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-good-extras gstreamer1-plugins-bad-free gstreamer1-plugins-bad-nonfree gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-plugins-ugly gstreamer1-plugins-bad-freeworld faac
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
#            fi
        ;;
        6)
            if [ -e /bin/vlc ]; then
                clear
                echo "You already have Broadcom Wireless drivers installed."
                read -p "Press (the infamous) any key to continue... " -n1 -s
            else
                clear
                echo "Starting install..."
                sudo dnf -y install vlc
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
            fi
        ;;
        7)
            if [ -e /bin/mc ]; then
                clear
                echo "You already have Midnight Commander installed."
                read -p "Press (the infamous) any key to continue... " -n1 -s
            else
                clear
                echo "Starting install..."
                sudo dnf -y install mc
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
            fi
        ;;
        8)
            if [ -e /bin/vim ]; then
                clear
                echo "You already have VIM installed."
                read -p "Press (the infamous) any key to continue... " -n1 -s
            else
                clear
                echo "Starting install..."
                sudo dnf -y install vim
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
            fi
        ;;
        8)
            if [ -e /bin/nmap ]; then
                clear
                echo "You already have nmap installed."
                read -p "Press (the infamous) any key to continue... " -n1 -s
            else
                clear
                echo "Starting install..."
                sudo dnf -y install nmap
                echo "Install done!"
                read -p "Press (the infamous) any key to continue... " -n1 -s
            fi
        ;;
        [qQ])
            clear
            echo "Fedora Install Tool v$FITVER"
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
