# Changing the default desktop on Ubuntu 16.04
_Published on 14.12.2017 at 12:00_

In my office at university, I have a desktop machine managed by the IT department, that runs a customised version of Ubuntu 16.04. I have sudo and can install whatever packages I like, but not necessarily without causing problems with the customisations made by IT.

A while back I decided to install i3 instead of using the default desktop, Unity. This worked nicely for a while, and I eventually decided to switch back to Unity. I uninstalled i3 and the other packages I used alongside it. Then I tried to log into my user account on the lightdm login screen, and was greeted by a scary message, saying '_Failed to execute login command_'.

Uh-oh. It seems like the system was able to change my default desktop to i3 when I installed it, but not change it back when I removed it.

After much googling, I found several potential solutions to this:

- Edit `~/.dmrc` to list `ubuntu` as the user's session
- Edit `/etc/lightdm/lightdm.conf` to read:

        [SeatDefaults]
        user-session=ubuntu
        ...

- Run the following commands:

        sudo dpkg-reconfigure ubuntu-session
        sudo dpkg-reconfigure ubuntu-desktop
        sudo apt install --reinstall ubuntu-session ubuntu-desktop

I did all of this, and still got the error. Those commands may have been necessary, I don't know. What I do know is that after editing `/var/lib/AccountsService/users/my-username` to say `XSession=ubuntu`, I was able to log in again properly.

Happy days.
