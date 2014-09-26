=============================== 
==== XAMPP DOMAIN CREATOR  ====
=============================== 

Created by Jimmy Hoang
-------------------------

I made this script to hep you create a virtual domain easier. 

It is a batch file that prompt you to input name then it will create a folder with the same name in htdocs folder. It also add config in httpd-vhosts.conf and modify the hosts file.

Default suffix is "dev" so if you enter jimmy as folder name you will have new virtual domain http://jimmy.dev You can change the suffix by edit line 5 in this script: SET SUFFIX="dev"



INSTALLATION
============================================================================

It is very easy, just copy create_domain.bat file into your XAMPP installed directory.



USING
============================================================================

You can open a commandline window then change to XAMPP installed directory and run create_domain.bat.bat file
Or open XAMPP shell window and run create_domain command.


============================================================================

Thank you for downloading the Xampp Domain Creator. I hope it helps you to streamline
web development workflow. 