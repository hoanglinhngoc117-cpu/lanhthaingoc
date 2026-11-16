# ==============================================================================
# SCRIPT KHỞI ĐỘNG GIAO DIỆN WEB DASHBOARD LOCALHOST - MINH AN TECH
# Chạy nền tảng FastAPI + Uvicorn trên http://localhost:8088
# ==============================================================================

$port = 8088
$url = "http://localhost:$port/"
$pythonPath = "C:\Users\Admin\AppData\Local\Programs\Python\Python311\python.exe"
$appPath = Join-Path $PSScriptRoot "app.py"

Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host "   KHOI DONG GIAO DIEN WEB AI AGENT B2B - CONG TY MINH AN                      " -ForegroundColor Yellow
Write-Host "   Dia chi truy cap: $url" -ForegroundColor Green
Write-Host "================================================================================" -ForegroundColor Cyan

# Mở trình duyệt mặc định sau 1 giây
Start-Process -FilePath $url -ErrorAction SilentlyContinue

# Chạy server FastAPI
& $pythonPath $appPath --port $port
