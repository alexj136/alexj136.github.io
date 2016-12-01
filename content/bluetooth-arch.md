Title: Bluetooth Audio with Arch Linux
Date: 2016-12-01 14:00
Category: Blog
Tags: bluetooth, archlinux, pulseaudio, blueman
Slug: bluetooth-arch
Authors: Alex Jeffery
Summary: Configuring Bluetooth Speakers with Arch Linux

Something I've been meaning to figure out for a while is how to use bluetooth speakers with Arch Linux. After numerous attempts over the last year, today I was finally successful.

My laptop doesn't have bluetooth built in, so I bought a cheap USB dongle from Amazon. The reviews said it worked with a raspberry pi so I figured it'd be fine under Arch.

### Installing software

If you use Arch linux as a daily driver, then you probably already have pulseaudio and pavucontrol installed and configured. This was the case for me. If you don't, [then you'll need to](https://wiki.archlinux.org/index.php/PulseAudio).

Next install `blueman` and `pulseaudio-bluetooth`:

    $ sudo pacman -S blueman pulseaudio-bluetooth
<br/>
### Getting things running

First, plug your bluetooth dongle in (if necessary).

Installing `blueman` will install `bluez` (among other things) as a dependency. `bluez` comes with a systemd service that needs to be running when you want to use bluetooth. So next, run:

    $ sudo systemctl start bluetooth.service

You can check that the service is running properly with:

    $ systemctl status bluetooth.service

Next, run the blueman applet:

    $ blueman-applet

Now you should have a pretty little bluetooth icon in your system tray. Click on it and you'll get a window that you can use to connect to your speaker.

Put your speaker in pairing mode and hit 'Search' in the blueman window. Your device should appear in the window. Right-click on it and select 'Audio Sink'.

Next open pavucontrol and navigate to the 'Configuration' tab. Make sure 'High Fidelity Playback (A2DP Sink)' is selected as the Profile option for your device.

Now try playing some audio, and with any luck you'll hear it through your bluetooth speaker. You can control the volume from the 'Output Devices' tab in pavucontrol.

### Running at startup

To run the bluetooth service at startup:

    $ sudo systemctl enable bluetooth.service

Note that to undo this, run the same command, replacing `enable` with `disable`.

Run blueman at startup by putting the following in your `.xinitrc`:

    # ~/.xinitrc
    exec blueman-applet
<br/>
#### References

- [This](http://www.archlinuxuser.com/2013/08/how-to-install-bluetooth-manager-on.html) excellent post by archlinuxuser
- [The ArchWiki page](https://wiki.archlinux.org/index.php/Blueman) for Blueman
- [The ArchWiki page](https://wiki.archlinux.org/index.php/bluetooth) for Bluetooth
