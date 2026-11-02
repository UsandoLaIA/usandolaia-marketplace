---
name: affine-workspace
description: Convenciones y límites para trabajar en el AFFiNE del equipo (affine.usandolaia.com) con las herramientas mcp__affine__*. Usar siempre que se lea, cree, edite, suba o elimine contenido en AFFiNE.
---

# Trabajar en el AFFiNE del equipo

## Antes de actuar
- Busca antes de crear (`search_docs`, `find_doc_by_title`) para no duplicar docs.
- Coloca los docs nuevos dentro de la carpeta/colección que corresponda; evita dejar docs huérfanos en la raíz.
- Cada persona usa su propia cuenta: los cambios quedan a su nombre.

## Eliminar
- Elimina solo contenido que el usuario haya creado o que pida explícitamente borrar. Nunca borres en masa sin listar primero qué se va a eliminar y obtener confirmación.
- Prefiere `trash_doc` (recuperable desde la papelera) a borrados definitivos.
- No toques docs de otras personas sin que el usuario lo pida de forma explícita.

## Límites conocidos de la herramienta
- Las vistas de bases de datos (filtros, orden, columnas ocultas, vistas extra) NO se pueden crear ni editar por MCP: solo la vista inicial (tabla o kanban). Eso se hace a mano en la interfaz de AFFiNE. No hay vista Calendario ni Formulario.
- Canvases (edgeless) grandes: pueden dar timeout (`space:load-doc timeout`). Verifica con `get_edgeless_canvas` antes de reintentar; un append fallido puede dejar una nota vacía que hay que borrar. Evita llamadas en paralelo sobre el mismo doc.
- En conectores de canvas, pasa siempre `sourceId`/`targetId` además de las posiciones, o se desenlazan.
- Si las herramientas `mcp__affine__*` no aparecen, el servidor se añadió con la sesión ya abierta: hay que reiniciar Claude Code. Si hay error de sesión, el usuario debe ejecutar `affine-mcp login --save-credentials`.
