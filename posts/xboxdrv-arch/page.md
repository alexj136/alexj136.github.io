Sometimes I'm embarrassed to admit it, but I really like Minecraft. What I don't like, however, is playing it with a laptop keyboard. Among other problems, it requires me to sit closer to the screen than I'd like. So since I had an xbox 360 controller lying around, I decided to see if I could configure it to work with my Arch Linux setup.

A quick google search revealed that there is a fairly mature Linux driver for the xbox 360 controller called xboxdrv. It supports some other controllers as well. It can be installed on Arch Linux via an AUR package.

### Installation

Click 'download snapshot' on the [xboxdrv AUR page](https://aur.archlinux.org/packages/xboxdrv/) to download the AUR package. If you've not used AUR packages before, I recommend reading the [relevant ArchWiki Page](https://wiki.archlinux.org/index.php/Arch_User_Repository).

Move the downloaded tarball wherever you keep your AUR packages (mine are at `~/aurbuilds/`), and extract it with

    $ tar -xvf xboxdrv.tar.gz

and then cd into the extracted archive. At this point, to be safe, it's a good idea to have a glance at the `PKGBUILD` just to make sure everything is as it should be. Be on the eye out for anything resembling '`rm -rf ~`'.

If you're sure everything is okay, install the package with

    $ makepkg -sri

This will require you to enter your password, and to confirm operations a couple of times.

### Configuration

Installing the AUR package gives you a systemd service that you can use to run xboxdrv:

    $ sudo systemctl start xboxdrv.service

You can kill it with:

    $ sudo systemctl stop xboxdrv.service

And if you want it to run at startup:

    $ sudo systemctl enable xboxdrv.service

If you want to disable it from running at startup:

    $ sudo systemctl disable xboxdrv.service

This systemd service reads the xboxdrv configuration from `/etc/default/xboxdrv`, so you can edit that in order to customise the controller's behaviour according to your needs. Here's my configuration, which works great in Minecraft. I adapted it from [this blog post](http://pspeter3.com/blog/2011/09/26/playing-minecraft-with-an-xbox360-controller/).

    # /etc/default/xboxdrv
    # Arch Linux xboxdrv config file, configured for minecraft.

    [xboxdrv]
    ui-clear=true
    trigger-as-button = true

    [xboxdrv-daemon]
    dbus = disabled

    [ui-axismap]
    x1=KEY_A:KEY_D
    y1=KEY_W:KEY_S
    x2^dead:4000 = REL_X:750:-1
    y2^dead:4000 = REL_Y:750:-1

    [ui-buttonmap]
    a = KEY_SPACE
    b = KEY_LEFTSHIFT
    x = KEY_Q
    y = KEY_T
    lb = rel:REL_WHEEL:1:500
    rb = rel:REL_WHEEL:-1:500
    lt = BTN_RIGHT
    rt = BTN_LEFT

    [ui-buttonmap]
    dl = KEY_A
    dr = KEY_D
    du = KEY_W
    dd = KEY_S

    [ui-buttonmap]
    start = KEY_E
    back  = KEY_ESC
