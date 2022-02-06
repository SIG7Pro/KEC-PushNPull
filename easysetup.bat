@echo off
title FNF Setup - Start
echo Make sure Haxe 4.2.4 and HaxeFlixel is installed.
echo Press any key to install required libraries.
pause >nul
title FNF Setup - Installing libraries
echo Installing haxelib libraries...
haxelib install lime 7.9.0
haxelib install openfl
haxelib install flixel 4.10.0
haxelib install flixel-tools
haxelib install flixel-ui
haxelib install hscript
haxelib install flixel-addons
haxelib install actuate
haxelib install hxcpp-debug-server
haxelib run lime setup
haxelib run lime setup flixel
haxelib run flixel-tools setup
title FNF Setup - User action required
cls
haxelib run flixel-tools setup
cls
echo Make sure you have git installed. You can download it here: https://git-scm.com/downloads
echo Press any key to install the git libraries.
pause >nul
title FNF Setup - Installing libraries
haxelib git linc_luajit https://github.com/nebulazorua/linc_luajit.git
haxelib git hxvm-luajit https://github.com/nebulazorua/hxvm-luajit
haxelib git faxe https://github.com/uhrobots/faxe
haxelib git polymod https://github.com/MasterEric/polymod.git
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc
cls

title FNF Setup - User action required
set /p menu="Would you like to install Extension-Webm? (Its not needed) [Y/N]"
       if %menu%==Y goto WEBM
       if %menu%==y goto WEBM
       if %menu%==N goto SkipWEBM
       if %menu%==n goto SkipWEBM
       cls

title FNF Setup - User action required
set /p menu="Would you like to install Visual Studio Community and components? (Necessary to compile/ 5.5GB) [Y/N]"
       if %menu%==Y goto InstallVSCommunity
       if %menu%==y goto InstallVSCommunity
       if %menu%==N goto SkipVSCommunity
       if %menu%==n goto SkipVSCommunity
       cls


:SkipVSCommunity
cls
title FNF Setup - Success
echo Setup successful. Press any key to exit.
pause >nul
exit

:Skip WEBM
cls
gotoInstallVSCommunity

:WEBM
cls
title FNF Setup - Installing WEBM
haxelib git extension-webm https://github.com/KadeDev/extension-webm
lime rebuild extension-webm windows
gotoInstallVSCommunity

:InstallVSCommunity
title FNF Setup - Installing Visual Studio Community
curl -# -O https://download.visualstudio.microsoft.com/download/pr/3105fcfe-e771-41d6-9a1c-fc971e7d03a7/8eb13958dc429a6e6f7e0d6704d43a55f18d02a253608351b6bf6723ffdaf24e/vs_Community.exe
vs_Community.exe --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.Windows10SDK.19041 -p
del vs_Community.exe
goto SkipVSCommunity
