# Instala Node.js (si falta) y affine-mcp, y guarda el login de ESTA persona.
# El plugin ya registra el servidor MCP.
$ErrorActionPreference = 'Stop'
$AffineUrl = 'https://affine.usandolaia.com'

function Update-SessionPath {
    $machine = [Environment]::GetEnvironmentVariable('Path', 'Machine')
    $user    = [Environment]::GetEnvironmentVariable('Path', 'User')
    $env:Path = "$machine;$user"
}

function Test-Node {
    Update-SessionPath
    [bool](Get-Command node -ErrorAction SilentlyContinue) -and [bool](Get-Command npm -ErrorAction SilentlyContinue)
}

function Install-Node {
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        Write-Host "Instalando Node.js LTS con winget..." -ForegroundColor Cyan
        winget install --id OpenJS.NodeJS.LTS -e --silent --accept-package-agreements --accept-source-agreements
        if (Test-Node) { return }
    }
    Write-Host "winget no disponible o fallo; descargando el instalador oficial de Node.js LTS..." -ForegroundColor Cyan
    $index = Invoke-RestMethod 'https://nodejs.org/dist/index.json'
    $lts = ($index | Where-Object { $_.lts } | Select-Object -First 1).version
    $arch = if ([Environment]::Is64BitOperatingSystem) { 'x64' } else { 'x86' }
    $msi = Join-Path $env:TEMP "node-$lts-$arch.msi"
    Invoke-WebRequest "https://nodejs.org/dist/$lts/node-$lts-$arch.msi" -OutFile $msi
    Start-Process msiexec.exe -ArgumentList "/i `"$msi`" /qn /norestart" -Wait -Verb RunAs
    Remove-Item $msi -ErrorAction SilentlyContinue
}

Write-Host "`n[1/3] Comprobando Node.js..." -ForegroundColor Cyan
if (Test-Node) {
    Write-Host "Node $(node --version) ya instalado."
} else {
    Install-Node
    if (-not (Test-Node)) {
        throw "No se pudo instalar Node.js automaticamente. Instalalo desde https://nodejs.org y vuelve a ejecutar."
    }
    Write-Host "Node $(node --version) instalado."
}

Write-Host "`n[2/3] Instalando affine-mcp-server..." -ForegroundColor Cyan
npm install -g affine-mcp-server
Update-SessionPath
$npmBin = (npm prefix -g).Trim()
if ($env:Path -notlike "*$npmBin*") { $env:Path = "$env:Path;$npmBin" }

Write-Host "`n[3/3] Login en AFFiNE con TU cuenta (email/password). Si pregunta la URL, Enter = $AffineUrl" -ForegroundColor Cyan
$env:AFFINE_BASE_URL = $AffineUrl
affine-mcp login --save-credentials

Write-Host "`nVerificando..." -ForegroundColor Cyan
affine-mcp status
Write-Host "`nListo. CIERRA y vuelve a abrir Claude Code (necesita el PATH nuevo) para que aparezcan las herramientas de AFFiNE." -ForegroundColor Green
