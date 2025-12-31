@ECHO OFF
mode con: lines=68
TITLE FACEIT CS2 NA Server Ping Monitor - by weecritikal

:top
CLS
ECHO ================================================================================
ECHO             FACEIT CS2 NA Server Ping Monitor by weecritikal 
ECHO             Auto Ping Mode: ENABLED - The pings refresh automatically 
ECHO ================================================================================
color 07

REM -------------------- PING SERVERS --------------------
CALL:pingtest1 108.181.62.197 185.93.1.65 103.214.111.228 104.128.48.3
CALL:pingtest2 108.181.54.9 66.23.201.30 89.187.164.1 192.3.237.150 104.160.151.182
CALL:pingtest3 173.248.162.1
CALL:pingtest4 167.160.91.2 185.152.67.2 107.175.180.6
CALL:pingtest5 172.93.99.1
CALL:pingtest6 185.59.223.8 66.23.200.20
CALL:pingtest7 199.127.60.205 195.181.162.195

REM -------------------- SERVER PING OUTPUT --------------------
ECHO.
ECHO [Chicago]
ECHO - chicago.PS           (108.181.62.197)       (%ms1%)
ECHO - chicago.cdn77        (185.93.1.65)          (%ms2%)
ECHO - chicago.GSL          (103.214.111.228)      (%ms3%)
ECHO - chicago.v            (104.128.48.3)         (%ms4%)
ECHO.

ECHO [Dallas]
ECHO - Dallas.PS            (108.181.54.9)         (%ms5%)
ECHO - Dallas.GSL           (66.23.201.30)         (%ms6%)
ECHO - Dallas.cdn77         (89.187.164.1)         (%ms7%)
ECHO - Dallas.colocrossing  (192.3.237.150)        (%ms8%)
ECHO - Dallas.RIOT          (104.160.151.182)      (%ms9%)
ECHO.

ECHO [Denver]
ECHO - Denver.cdn77         (173.248.162.1)        (%ms10%)
ECHO.

ECHO [San-Jose]
ECHO - sanjose.hz           (167.160.91.2)         (%ms11%)
ECHO - sanjose.cdn77        (185.152.67.2)         (%ms12%)
ECHO - sanjose.colocrossing (107.175.180.6)        (%ms13%)
ECHO.

ECHO [Virginia]
ECHO - virginia.hz          (172.93.99.1)          (%ms14%)
ECHO.

ECHO [New-York]
ECHO - ny.cdn77             (185.59.223.8)         (%ms15%)
ECHO - ny.gsl               (66.23.200.20)         (%ms16%)
ECHO.

ECHO [Miami]
ECHO - miami.hz             (199.127.60.205)       (%ms17%)
ECHO - miami.cdn77          (195.181.162.195)      (%ms18%)
ECHO.

ECHO ================================================================================
ECHO Note: "ERROR" means the ping could not be measured.
ECHO Possible reasons:
ECHO - ICMP is blocked by the server
ECHO - Server temporarily unreachable or under load
ECHO - Your own network connection may be unstable
ECHO ================================================================================

REM -------------------- TOP 5 LOWEST PING REGIONS --------------------
SETLOCAL ENABLEDELAYEDEXPANSION

SET regionChicago=!ms1!
IF !ms2! NEQ ERROR IF !ms2! LSS !regionChicago! SET regionChicago=!ms2!
IF !ms3! NEQ ERROR IF !ms3! LSS !regionChicago! SET regionChicago=!ms3!
IF !ms4! NEQ ERROR IF !ms4! LSS !regionChicago! SET regionChicago=!ms4!

SET regionDallas=!ms5!
IF !ms6! NEQ ERROR IF !ms6! LSS !regionDallas! SET regionDallas=!ms6!
IF !ms7! NEQ ERROR IF !ms7! LSS !regionDallas! SET regionDallas=!ms7!
IF !ms8! NEQ ERROR IF !ms8! LSS !regionDallas! SET regionDallas=!ms8!
IF !ms9! NEQ ERROR IF !ms9! LSS !regionDallas! SET regionDallas=!ms9!

SET regionDenver=!ms10!

SET regionSanJose=!ms11!
IF !ms12! NEQ ERROR IF !ms12! LSS !regionSanJose! SET regionSanJose=!ms12!
IF !ms13! NEQ ERROR IF !ms13! LSS !regionSanJose! SET regionSanJose=!ms13!

SET regionVirginia=!ms14!

SET regionNewYork=!ms15!
IF !ms16! NEQ ERROR IF !ms16! LSS !regionNewYork! SET regionNewYork=!ms16!

SET regionMiami=!ms17!
IF !ms18! NEQ ERROR IF !ms18! LSS !regionMiami! SET regionMiami=!ms18!

SET top1val=9999 & SET top2val=9999 & SET top3val=9999 & SET top4val=9999 & SET top5val=9999
SET top1=NONE & SET top2=NONE & SET top3=NONE & SET top4=NONE & SET top5=NONE

CALL :ComparePing !regionChicago! Chicago
CALL :ComparePing !regionDallas! Dallas
CALL :ComparePing !regionDenver! Denver
CALL :ComparePing !regionSanJose! San-Jose
CALL :ComparePing !regionVirginia! Virginia
CALL :ComparePing !regionNewYork! New-York
CALL :ComparePing !regionMiami! Miami

REM -------------------- LOWEST PING OUTPUT --------------------
ECHO.
ECHO Lowest Ping NA Servers:
ECHO - !top1! (~!top1val!)
ECHO - !top2! (~!top2val!)
ECHO - !top3! (~!top3val!)
ECHO - !top4! (~!top4val!)
ECHO - !top5! (~!top5val!)
ECHO Playing on these servers is recommended.
ECHO Some servers may not be currently be in the server selection pool. 
ECHO All potential servers are pinged for convencience if changes occur
ECHO.
ECHO ================================================================================
ECHO Waiting 45 seconds before pinging again...
ECHO ================================================================================
ENDLOCAL

TIMEOUT /T 45 /NOBREAK > NUL
GOTO top

REM -------------------- PING TEST FUNCTIONS --------------------
:pingtest1
SET ms1=ERROR & SET ms2=ERROR & SET ms3=ERROR & SET ms4=ERROR
ECHO + Pinging Chicago 1
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %1 ^| FIND "ms"') DO SET ms1=%%i
ECHO + Pinging Chicago 2
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %2 ^| FIND "ms"') DO SET ms2=%%i
ECHO + Pinging Chicago 3
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %3 ^| FIND "ms"') DO SET ms3=%%i
ECHO + Pinging Chicago 4
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %4 ^| FIND "ms"') DO SET ms4=%%i
GOTO:EOF

:pingtest2
SET ms5=ERROR & SET ms6=ERROR & SET ms7=ERROR & SET ms8=ERROR & SET ms9=ERROR
ECHO + Pinging Dallas 1
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %1 ^| FIND "ms"') DO SET ms5=%%i
ECHO + Pinging Dallas 2
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %2 ^| FIND "ms"') DO SET ms6=%%i
ECHO + Pinging Dallas 3
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %3 ^| FIND "ms"') DO SET ms7=%%i
ECHO + Pinging Dallas 4
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %4 ^| FIND "ms"') DO SET ms8=%%i
ECHO + Pinging Dallas 5
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %5 ^| FIND "ms"') DO SET ms9=%%i
GOTO:EOF

:pingtest3
SET ms10=ERROR
ECHO + Pinging Denver
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %1 ^| FIND "ms"') DO SET ms10=%%i
GOTO:EOF

:pingtest4
SET ms11=ERROR & SET ms12=ERROR & SET ms13=ERROR
ECHO + Pinging San-Jose 1
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %1 ^| FIND "ms"') DO SET ms11=%%i
ECHO + Pinging San-Jose 2
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %2 ^| FIND "ms"') DO SET ms12=%%i
ECHO + Pinging San-Jose 3
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %3 ^| FIND "ms"') DO SET ms13=%%i
GOTO:EOF

:pingtest5
SET ms14=ERROR
ECHO + Pinging Virginia
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %1 ^| FIND "ms"') DO SET ms14=%%i
GOTO:EOF

:pingtest6
SET ms15=ERROR & SET ms16=ERROR
ECHO + Pinging New-York 1
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %1 ^| FIND "ms"') DO SET ms15=%%i
ECHO + Pinging New-York 2
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %2 ^| FIND "ms"') DO SET ms16=%%i
GOTO:EOF

:pingtest7
SET ms17=ERROR & SET ms18=ERROR
ECHO + Pinging Miami 1
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %1 ^| FIND "ms"') DO SET ms17=%%i
ECHO + Pinging Miami 2
FOR /F "tokens=4 delims==" %%i IN ('ping -n 1 %2 ^| FIND "ms"') DO SET ms18=%%i
GOTO:EOF

:ComparePing
SET curVal=%1
SET curRegion=%2
IF "%curVal%"=="ERROR" GOTO :EOF
IF %curVal% LSS !top1val! (
    SET top5val=!top4val! & SET top5=!top4!
    SET top4val=!top3val! & SET top4=!top3!
    SET top3val=!top2val! & SET top3=!top2!
    SET top2val=!top1val! & SET top2=!top1!
    SET top1val=%curVal% & SET top1=%curRegion%
) ELSE IF %curVal% LSS !top2val! (
    SET top5val=!top4val! & SET top5=!top4!
    SET top4val=!top3val! & SET top4=!top3!
    SET top3val=!top2val! & SET top3=!top2!
    SET top2val=%curVal% & SET top2=%curRegion%
) ELSE IF %curVal% LSS !top3val! (
    SET top5val=!top4val! & SET top5=!top4!
    SET top4val=!top3val! & SET top4=!top3!
    SET top3val=%curVal% & SET top3=%curRegion%
) ELSE IF %curVal% LSS !top4val! (
    SET top5val=!top4val! & SET top5=!top4!
    SET top4val=%curVal% & SET top4=%curRegion%
) ELSE IF %curVal% LSS !top5val! (
    SET top5val=%curVal% & SET top5=%curRegion%
)
GOTO:EOF
