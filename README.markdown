A Gentoo overlay with some ebuilds that I am interested to and are not yet on the official tree.  


== Configure layman to manage this overlay ==

 To use this overlay with layman is very simple. You just have do add one line to the _/etc/layman/layman.cfg_. Find the line with _overlay :_ e add, in a new line, this URL: _http://github.com/daltonmatos/gentoo-overlay/raw/master/profiles/overlay.xml_  
 Now just run: _layman -a dalton_ and you are ready to go!  

Feel free to fork and add more ebuilds.  

 - Dalton Barreto
