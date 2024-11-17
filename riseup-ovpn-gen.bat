@echo off
setlocal enabledelayedexpansion
color 1f
title riseup-ovpn-gen
set Seattle=vpn01-sea.riseup.net
set Paris=vpn02-par.riseup.net
set Paris2=vpn03-par.riseup.net
set Amsterdam=vpn04-ams.riseup.net
set Paris3=vpn05-par.riseup.net
set Amsterdam2=vpn06-ams.riseup.net
set Paris4=vpn07-par.riseup.net
set Paris5=vpn08-par.riseup.net
set Montreal=vpn10-mtl.riseup.net
set Paris6=vpn11-par.riseup.net
set NYC=vpn12-nyc.riseup.net
set Amsterdam3=vpn13-ams.riseup.net
set Paris7=vpn14-par.riseup.net
set Seattle2=vpn15-sea.riseup.net
set Seattle3=vpn16-sea.riseup.net
set Montreal2=vpn18-mtl.riseup.net
set Amsterdam4=vpn19-ams.riseup.net
set Paris8=vpn20-par.riseup.net
set Paris9=vpn21-par.riseup.net
set Miami=vpn22-mia.riseup.net
set Miami2=vpn23-mia.riseup.net
:GATEWAY
::: @@@@@@@@@@@@@@@@@@&&&####&&&&&@@@@@@@@@@@@@@@@@@@@
::: @@@@@@@@@@@@&#BGPPP55555PPPPPPPGGB#&@@@@@@@@@@@@@@
::: @@@@@@@@&BGP5555555555555PPPPPPPPPPPPGB&@@@@@@@@@@
::: @@@@@@#P5555555555PB########BPPPPPPPPPPPPB@@@@@@@@
::: @@@@@@B5555555555G@@@@@@@&BGPPPPPPPPPPPPPG@@@@@@@@
::: @@@@@@B555555555P&@@@@@@B5PPPPPPPPPPPPPPPG@@@@@@@@
::: @@@@@@B555555555#@@@@@@@&GPPPPPPPPPPPPPPPG@@@@@@@@
::: @@@@@@B55555555B@@@@@@@@@@&#GPPPPPPPPPPPPG@@@@@@@@
::: @@@@@@B5555555P@@@@@@@@@@@@@@BPPPPPPPPPPPG@@@@@@@@
::: @@@@@@B5555555P@@@@@@@@@@@@@@@GPPPPPPPPPPG@@@@@@@@
::: @@@@@@B55555555&@@@@@@@@@@@@@@#PPPPPPPPPPG@@@@@@@@
::: @@@@@@B55555555P&@@@@@@@@@@@@@@GPPPPPPPPPG@@@@@@@@
::: @@@@@@#555555555P&@@@@@@@@@@@@@BPPPPPPPPPG@@@@@@@@
::: @@@@@@#5555555555P&@@&@@@@@@@@@@PPPPPPPPPB@@@@@@@@
::: @@@@@@@P55555555555B@B5PGB&@@@@@BPPPPPPPP&@@@@@@@@
::: @@@@@@@&P5555555555P@G555PPG&@@@@&GPPPPPB@@@@@@@@@
::: @@@@@@@@&P55555555PBP555PPP5BB&@@@@#PPPB@@@@@@@@@@
::: @@@@@@@@@&G555PGGB&BGP55PPGB&BPG#&&#PP#@@@@@@@@@@@
::: @@@@@@@@@@@#P55PPPPPP555PPPPPPPPPPPPG&@@@@@@@@@@@@
::: @@@@@@@@@@@@&B5555555555PPPPPPPPPPG#@@@@@@@@@@@@@@
::: @@@@@@@@@@@@@@&BP5555555PPPPPPPPG&@@@@@@@@@@@@@@@@
::: @@@@@@@@@@@@@@@@@#GP5555PPPPPGB&@@@@@@@@@@@@@@@@@@
::: @@@@@@@@@@@@@@@@@@@&#GP5PPG#&@@@@@@@@@@@@@@@@@@@@@
::: @@@@@@@@@@@@@@@@@@@@@@@&#&@@@@@@@@@@@@@@@@@@@@@@@@
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo Support radical alternatives!
echo Please consider supporting RISEUP through mail, PayPal, Liberapay, and cryptocurrency!
echo https^:^/^/riseup.net^/en^/donate
echo Gateway: (Seattle) (Paris) (Paris2) (Amsterdam) (Paris3) (Amsterdam2) (Paris4) (Paris5) (Montreal) (Paris6) (NYC) (Amsterdam3) (Paris7) (Seattle2) (Seattle3) (Montreal2) (Amsterdam4) (Paris8) (Paris9) (Miami) (Miami2)
set /p GATEWAY=">"
REM THANKS TO SS64.COM
if defined %GATEWAY% goto PORT
if not defined %GATEWAY% goto GATEWAY
goto GATEWAY
:PORT
if %GATEWAY%==Seattle set LINE=1
if %GATEWAY%==Paris set LINE=2
if %GATEWAY%==Paris2 set LINE=3
if %GATEWAY%==Amsterdam set LINE=4
if %GATEWAY%==Paris3 set LINE=5
if %GATEWAY%==Amsterdam2 set LINE=6
if %GATEWAY%==Paris4 set LINE=7
if %GATEWAY%==Paris5 set LINE=8
if %GATEWAY%==Montreal set LINE=9
if %GATEWAY%==Paris6 set LINE=10
if %GATEWAY%==NYC set LINE=11
if %GATEWAY%==Amsterdam3 set LINE=12
if %GATEWAY%==Paris7 set LINE=13
if %GATEWAY%==Seattle2 set LINE=14
if %GATEWAY%==Seattle3 set LINE=15
if %GATEWAY%==Montreal2 set LINE=16
if %GATEWAY%==Amsterdam4 set LINE=17
if %GATEWAY%==Paris8 set LINE=18
if %GATEWAY%==Paris9 set LINE=19
if %GATEWAY%==Miami set LINE=20
if %GATEWAY%==Miami2 set LINE=21
set GATEWAY=!%GATEWAY%!
REM THANKS TO @USER1931 VIA SUPERUSER
set HOST5L=%GATEWAY:~0,9%
:PORTSELECTION
echo Port: (53) (80) (1194)
echo Recommended: 1194
set /p PORT=">"
if %PORT%==53 goto PROTOCOL
if %PORT%==80 goto PROTOCOL
if %PORT%==1194 goto PROTOCOL
goto PORTSELECTION
:PROTOCOL
echo Protocol: (tcp) (udp)
echo Recommended: udp
set /p PROTOCOL=">"
if %PROTOCOL%==tcp goto GENERATE
if %PROTOCOL%==udp goto GENERATE
goto PROTOCOL
:GENERATE
echo Gateway: %GATEWAY% Port: %PORT% Protocol: %PROTOCOL%
REM THANKS TO @ABEL AND @CWT VIA STACKOVERFLOW
REM NVM, NOW THANKS TO @TGLATZER VIA STACKOVERFLOW
REM NVM AGAIN LULZ
REM powershell -Command "(New-Object Net.WebClient).DownloadFile('https://black.riseup.net/ca.crt', '.\tmp\ca.crt')"
powershell -Command "Invoke-WebRequest 'https://black.riseup.net/ca.crt' -OutFile '.\tmp\ca.crt'"
REM powershell -Command "(New-Object Net.WebClient).DownloadFile('https://riseup.net/provider.json', '.\tmp\provider.json')"
powershell -Command "Invoke-WebRequest 'https://riseup.net/provider.json' -OutFile '.\tmp\provider.json'"
REM powershell -Command "(New-Object Net.WebClient).DownloadFile('https://api.black.riseup.net/3/config/eip-service.json', '.\tmp\eip-service.json')"
powershell -Command "Invoke-WebRequest 'https://api.black.riseup.net/3/config/eip-service.json' -OutFile '.\tmp\eip-service.json'"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://api.black.riseup.net/3/cert', '.\tmp\cert')"
REM powershell -Command "Invoke-WebRequest 'https://api.black.riseup.net/3/cert' -OutFile '.\tmp\cert'"
REM THANKS TO COLLECTINGWISDOM.COM
REM THANKS TO JSONBEAUTIFY.COM
REM powershell -Command "(Get-Content '.\tmp\eip-service.json' | ConvertFrom-Json).gateways.capabilities.transport.options.cert" > .\tmp\cert.txt
powershell -Command "(Get-Content '.\tmp\eip-service.json' | ConvertFrom-Json).gateways.ip_address" > .\tmp\ip-address.txt
powershell -Command "(Get-Content '.\tmp\eip-service.json' | ConvertFrom-Json).gateways.host" > .\tmp\host.txt
powershell -Command "(Get-Content '.\tmp\eip-service.json' | ConvertFrom-Json).openvpn_configuration" > .\tmp\openvpn-configuration.txt
powershell -Command "{$content = Get-Content -Path ".\tmp\openvpn-configuration.txt"; $content = $content -replace ':', ''; Set-Content -Path ".\tmp\openvpn-configuration.tmp.txt" -Value $content}" >nul
REM THANKS TO @COMPO VIA STACKOVERFLOW
@If Exist ".\tmp\openvpn-configuration.tmp.txt" (For /F Delims^=^ EOL^= %%A In ('More /T1 ".\tmp\openvpn-configuration.tmp.txt"')Do @Set "$=%%A"&Call Echo(%%$: =%%) > ".\tmp\openvpn-configuration.txt"
type .\tmp\openvpn-configuration.txt>.\tmp\openvpn-configuration.tmp.txt
@If Exist ".\tmp\openvpn-configuration.tmp.txt" (For /F Delims^=^ EOL^= %%A In ('More /T1 ".\tmp\openvpn-configuration.tmp.txt"')Do @Set "$=%%A"&Call Echo(%%$::= %%) > ".\tmp\openvpn-configuration.txt"
REM THANKS TO @FRODE F. VIA STACKOVERFLOW
powershell -Command "(Get-Content .\tmp\ip-address.txt)[!LINE!-1]">.\tmp\ip-address.tmp.txt
REM THANKS TO @PHUCLV AND @WILL BICKFORD VIA STACKOVERFLOW
set /p IP=<.\tmp\ip-address.tmp.txt
set /? |find "/P" >nul
REM THANKS TO @COMPO VIA STACKOVERFLOW
@If Exist "template.txt" (For /F Delims^=^ EOL^= %%A In ('More /T1 "template.txt"')Do @Set "$=%%A"&Call Echo(%%$:IPADDRESS=!IP!%%)>".\tmp\template.tmp.txt"
@If Exist ".\tmp\template.tmp.txt" (For /F Delims^=^ EOL^= %%A In ('More /T1 ".\tmp\template.tmp.txt"')Do @Set "$=%%A"&Call Echo(%%$:PORT=!PORT!%%)>".\tmp\template.tmp2.txt"
@If Exist ".\tmp\template.tmp2.txt" (For /F Delims^=^ EOL^= %%A In ('More /T1 ".\tmp\template.tmp2.txt"')Do @Set "$=%%A"&Call Echo(%%$:PROTOCOL=!PROTOCOL!%%)>".\tmp\template.tmp.txt"
@If Exist ".\tmp\template.tmp.txt" (For /F Delims^=^ EOL^= %%A In ('More /T1 ".\tmp\template.tmp.txt"')Do @Set "$=%%A"&Call Echo(%%$:HOST5L=!HOST5L!%%)>".\tmp\template.tmp2.txt"
echo ^<ca^>>>.\tmp\template.tmp2.txt
type .\tmp\ca.crt>>.\tmp\template.tmp2.txt
echo ^<^/ca^>>>.\tmp\template.tmp2.txt
echo ^<cert^>>>.\tmp\template.tmp2.txt
REM THANKS TO @COLSW VIA STACKOVERFLOW
powershell -Command "Get-Content '.\tmp\cert' -Raw | Select-String '(?sm)-----BEGIN CERTIFICATE-----(.+)-----END CERTIFICATE-----' | Select -Expand Matches | Select -First 1 -Expand Value" > .\tmp\cert.txt
powershell -Command "Get-Content '.\tmp\cert' -Raw | Select-String '(?sm)-----BEGIN RSA PRIVATE KEY-----(.+)-----END RSA PRIVATE KEY-----' | Select -Expand Matches | Select -First 1 -Expand Value" > .\tmp\key.txt
type .\tmp\cert.txt>>.\tmp\template.tmp2.txt
echo ^<^/cert^>>>.\tmp\template.tmp2.txt
echo ^<key^>>>.\tmp\template.tmp2.txt
type .\tmp\key.txt>>.\tmp\template.tmp2.txt
echo ^<^/key^>>>.\tmp\template.tmp2.txt
type .\tmp\template.tmp2.txt>%GATEWAY%.ovpn
exit