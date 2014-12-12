2048 Auto Play
==========

Simple Theos tweak which enables auto play on 2048.


###What does it do?

Adds a red button to the view, if tapped the tweak will take over and play until game over.


###How does it work?

The tweak operates the app just like the user by simulating swipe events. By checking the status the board before and after the tweak is able to tell if a swipe successfully did something.


###How well does it work?

The tweak has got to the 512 block, but usually only gets to 256.

Currently this is just a proof of concept, the 'brains' behind the app are very limited. The basic algorithm tries to keep the important blocks in the top left. No processing of the board state is currently being done. The logic is simply:

* Try moving left, if successful restart
* Try moving up, if successful restart
* Try moving down, if successful restart
* Move right, restart (worst case scenario)

###Can I install it on my device?

Yes, but it'll take some work! First you must have a jailbroken iOS device. Second you will need to dump some headers and move the substrate frameworks into the theos folder. For more info please read here: http://iphonedevwiki.net/index.php/Theos/Setup