@echo off
title 



ipconfig /release
ipconfig /flushdns
ipconfig /renew
netsh winsock reset
netsh int ip reset
netsh int ipv6 reset
netsh interface ip delete arpcache
hostname
netsh interface ip delete destinationcache
netsh wlan delete profile name=*

