# Fedora Install Tool v0.1

There isn't much to say other than this shell script will install [Resilio BTsync](http://resilio.com), [RPM Fusion](http://rpmfusion.org) repos, (the dreaded) Broadcom Wireless drivers and [Powerline](https://fedoramagazine.org/add-power-terminal-powerline/) on your Fedora install.

The shell script will not install repos and drivers by just running the script.

You will be presented with the options to install each seperately.

When chosing to install Resilio BTsync it will first install the repo then install BTsync. It will also add aliases to .bashrc.

When chosing to install RPM Fusion repo it will install both free and non-free repos (no software will be installed).

For those of you who love Fedora, but end up with computers with the Broadcom Wireless chipset, you can now easily install the drivers with one click. Keep in mind, you still need to be connected by ethernet and install the RPM Fusion repos first.

### Roadmap

* Add audio codecs
* Add VLC (because why not)
