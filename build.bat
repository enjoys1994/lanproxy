@echo off
chcp 65001 > nul

call rmdir /s /q distribution

REM 设置替换字符串的变量
set "oldKey=7317847dff6a4ee789ad967fd81dfd4d"
set "newKey=f11e3a4b8fe942f08ba8c00fc4736efc"

REM 设置文件路径
set "filePath=D:\workspace\code\lanproxy\proxy-client\src\main\resources\config.properties"

powershell -Command "(Get-Content %filePath%) -replace '%oldKey%', '%newKey%' | Set-Content %filePath%"

call mvn clean package

powershell -Command "(Get-Content %filePath%) -replace '%newKey%', '%oldKey%' | Set-Content %filePath%"

cd /d distribution\proxy-client-0.1

call 7z a -tzip -r -spf -aoa ../../proxy.zip *

cd ../../

call copy proxy.zip ..\gameHelperServer\uploads\

call del proxy.zip


echo http://demo-test.online:8086/down?filename=proxy.zip