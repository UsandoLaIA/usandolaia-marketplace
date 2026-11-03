# Usando la IA — plugins de Claude Code

## affine-equipo

Conecta Claude Code con el AFFiNE del equipo (https://affine.usandolaia.com): crear, editar, subir y eliminar contenido desde Claude, con tu propia cuenta.

> **Solo funciona en Claude Code instalado en tu computador con Windows** (terminal o extensión de VS Code).
> No funciona en Claude web ni en sesiones en la nube.

### Antes de empezar

1. Pídele a Milena que te invite al workspace de AFFiNE (rol Collaborator) y crea tu cuenta.
2. Ten Claude Code instalado. Node.js no hace falta: el instalador lo añade si falta.

### Instalación (una sola vez)

En Claude Code, ejecuta uno por uno:

```
/plugin marketplace add UsandoLaIA/usandolaia-marketplace
/plugin install affine-equipo@usandolaia
```

Cierra y abre Claude Code, y ejecuta:

```
/affine-setup
```

Te dirá qué comando correr en PowerShell. Ese comando instala Node.js si falta, instala `affine-mcp` y te pide tu email y contraseña de AFFiNE. Windows puede mostrar una ventana de permisos: acéptala.

Cuando termine, **cierra y abre Claude Code de nuevo**. Pruébalo con: "Lista los docs del workspace de AFFiNE".

### Reglas de uso

- Usa tu propia cuenta. Los cambios quedan a tu nombre.
- Claude puede crear, editar, subir archivos y eliminar. Antes de pedir borrados masivos, revisa qué va a tocar. Lo borrado va a la papelera de AFFiNE.
- No se pueden crear vistas, filtros ni orden de bases de datos desde Claude: hazlo en la interfaz de AFFiNE.
- En canvases grandes pueden darse timeouts: verifica antes de repetir.

### Problemas frecuentes

| Problema | Qué hacer |
|---|---|
| `/plugin marketplace add` da 404 | Comprueba que escribiste `UsandoLaIA/usandolaia-marketplace` y que estás en Claude Code local |
| No aparecen herramientas de AFFiNE | Reinicia Claude Code |
| Error de sesión o login | En PowerShell: `affine-mcp login --save-credentials` |
| Ver el estado | En PowerShell: `affine-mcp status` |

### Actualizar

```
/plugin marketplace update usandolaia
```
