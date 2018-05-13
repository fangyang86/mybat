netsh int ipv6 show nei | findstr /B 2 >tmp.txt
echo echo on > tmp.bat
for /f %%a in (tmp.txt) do echo ping -6 /n 2 %%a >> tmp.bat
call tmp.bat
ping -6 ipv6.google.com