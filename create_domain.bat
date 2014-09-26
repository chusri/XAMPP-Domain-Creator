@echo off
cd /D %~dp0
SET XAMPPDIR=%~dp0
SET BASEURL=%XAMPPDIR%htdocs\
SET SUFFIX=dev

@echo off
echo ####### XAMPP Domain Creator v1.0 (c) Jimmy Hoang ######
echo:
echo:
@ECHO OFF
:sitenameprompt
::ask for a sitename
set /p sitename="Enter Sitename: " %=%

IF EXIST %BASEURL%%sitename% echo The specified site folder already exists! Choose another. 
IF EXIST %BASEURL%%sitename% goto sitenameprompt 

IF NOT EXIST %BASEURL%%sitename% echo Creating folder 
IF NOT EXIST %BASEURL%%sitename% MD %BASEURL%%sitename%

echo Adding virtualhost to httpd.conf
@echo off
(
echo:
echo:
echo    ###%sitename%###
echo    ^<VirtualHost *:80^>
echo        ServerAdmin admin@%sitename%
echo        DocumentRoot "%BASEURL%%sitename%"
echo        ServerName %sitename%.%SUFFIX%
echo        ServerAlias %sitename%.%SUFFIX%
echo        ^<Directory "%BASEURL%%sitename%"^>
echo            Options Indexes FollowSymLinks Includes ExecCGI
echo            Order allow,deny
echo            Allow from all
echo        ^</Directory^>
echo    ^</VirtualHost^>
echo    ^<VirtualHost *:443^>
echo        SSLEngine on
echo        SSLCertificateFile conf/ssl.crt/server.crt
echo        SSLCertificateKeyFile conf/ssl.key/server.key 
echo        DocumentRoot "%BASEURL%%sitename%"
echo        ServerName %sitename%.%SUFFIX%
echo        ServerAlias %sitename%.%SUFFIX% 
echo        ^<IfModule alias_module^>
echo            ScriptAlias /cgi-bin/ "%BASEURL%%sitename%/cgi-bin/"
echo        ^</IfModule^>
echo    ^</VirtualHost^>
) >>%XAMPPDIR%apache\conf\extra\httpd-vhosts.conf
pause
echo Write into hosts file
type "%SystemRoot%\system32\drivers\etc\hosts" | find "127.0.0.1 %sitename%.%SUFFIX%" ||echo.127.0.0.1 %sitename%.%SUFFIX%>>"%SystemRoot%\system32\drivers\etc\hosts"
pause
echo Restarting apache
%XAMPPDIR%apache\bin\httpd -k restart