yabai-chooser
=============

Coming from WMII I am used to wmiichooser.
Which allows to be passed a list of wordv (tags=spaces).
Then select one or enter a new one.

This yabai-chooser models it.

usage
=====
yabai-choser "TITLE" space1 sapce2 space3 space3

Type some chars to filter

Use command-{1,2,3} shortcuts to select out of first 10

Or hit Enter to choose your typed word

yabai
=====
When used with yabai of course you want to use managed=off to cause floating/
on top mode

~/.yabairc
```
yabai -m rule --add app="^yabai-chooser$" manage=off
```

language choice
===============
I checked quit a lot even fltk-rs but that consumed even 10 MB more.
So Swift seems to be good enough for this job even though making the command-*
keys work was a struggle.
