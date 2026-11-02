---
description: Instala y configura la conexión personal con el AFFiNE del equipo
---

Ayuda al usuario a terminar la conexión con AFFiNE (affine.usandolaia.com).

1. Comprueba si `affine-mcp` está en el PATH (`affine-mcp status`). Si funciona y muestra el workspace, dile que ya está listo y que si no ve las herramientas `mcp__affine__*` debe reiniciar Claude Code.
2. Si no está instalado o no hay sesión, explícale que el script instala Node.js automáticamente si falta (puede aparecer una ventana de permisos de Windows) y dile que ejecute en PowerShell, desde una terminal normal (el login pide la contraseña y es interactivo, no puede correrse desde aquí):
   `powershell -ExecutionPolicy Bypass -File "${CLAUDE_PLUGIN_ROOT}/scripts/setup.ps1"`
3. Nunca pidas ni pegues contraseñas o tokens en el chat.
4. Al terminar, indícale reiniciar Claude Code y probar con "lista los docs del workspace".
