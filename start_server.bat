@echo off
title MINH AN TECH - AI AGENT WEB SERVER
echo ================================================================================
echo    KHOI DONG GIAO DIEN WEB AI AGENT B2B - CONG TY MINH AN
echo    Dia chi truy cap: http://localhost:8088
echo ================================================================================

start http://localhost:8088/

"C:\Users\Admin\AppData\Local\Programs\Python\Python311\python.exe" app.py --port 8088
pause

