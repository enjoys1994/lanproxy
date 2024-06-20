@echo off
chcp 65001 > nul
REM 设置批处理文件路径
set "batchFilePath=startup.bat"

REM 设置快捷方式名称
set "shortcutName=lanProxyServer"

REM 设置启动文件夹路径
set "startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

REM 创建快捷方式.vbs文件
echo Set oWS = WScript.CreateObject("WScript.Shell") > create_shortcut.vbs
echo sLinkFile = "%startupFolder%\%shortcutName%.lnk" >> create_shortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> create_shortcut.vbs
echo oLink.TargetPath = "%batchFilePath%" >> create_shortcut.vbs
echo oLink.WorkingDirectory = "%~dp0" >> create_shortcut.vbs
echo oLink.Save >> create_shortcut.vbs

REM 执行.vbs文件以创建快捷方式
cscript //nologo create_shortcut.vbs

REM 删除.vbs文件
del create_shortcut.vbs

echo 快捷方式已创建并添加到启动文件夹。
