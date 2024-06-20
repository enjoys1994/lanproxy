@echo off
chcp 65001 > nul

call rmdir /s /q distribution

call mvn clean package


cd /d distribution\proxy-client-0.1

call 7z a -tzip -r -spf -aoa ../../proxyClient.zip *


