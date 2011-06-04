== Configure layman to manage this overlay ==

Add one line to the _/etc/layman/layman.cfg_. 
Find the line with _overlay :_ and add, in a new line, this URL: 
_http://github.com/punnie/gentoo-overlay/raw/master/profiles/overlay.xml_  

Now just run: _layman -a punnie_ and you are ready to go!  

Feel free to fork.

Thanks to daltonmatos for creating the original overlay.
