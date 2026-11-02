# Hook SessionStart: avisa a Claude si falta la instalacion local de affine-mcp.
$machine = [Environment]::GetEnvironmentVariable('Path', 'Machine')
$user    = [Environment]::GetEnvironmentVariable('Path', 'User')
$env:Path = "$env:Path;$machine;$user"
if (-not (Get-Command affine-mcp -ErrorAction SilentlyContinue)) {
    Write-Output "El plugin affine-equipo esta instalado pero 'affine-mcp' no esta en este equipo. Dile al usuario que ejecute /affine-setup para instalar Node.js, affine-mcp y hacer login en AFFiNE."
}
