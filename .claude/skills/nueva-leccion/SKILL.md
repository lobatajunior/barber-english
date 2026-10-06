---
name: nueva-leccion
description: Genera una lección nueva de Barber English (20 ejercicios, 8 tipos) siguiendo las reglas pedagógicas del proyecto, la registra en el archivo de datos de la sección y verifica que compila. Úsala cuando el usuario pida crear, generar o escribir una lección nueva.
argument-hint: "[sección] [nivel] [número o tema] — ej. barber_zone a2 17 'color de pelo'"
---

# /nueva-leccion — generar una lección de Barber English

Argumentos recibidos: `$ARGUMENTS` (sección, nivel, número y/o tema). Si falta
algo, dedúcelo: sección `barber_zone` por defecto, nivel = el del último archivo
de lección existente, número = el siguiente libre, tema = la siguiente parte de
`lib/data/conversaciones_raw.md` que aún no se ha usado. Pregunta solo si el
tema no se puede deducir.

## 1. Reunir contexto (obligatorio antes de escribir)

1. Lee `CLAUDE.md` (raíz): tipos de ejercicio, campos de cada tipo, reglas y
   la tabla de 20 ejercicios.
2. Lee `lib/CLAUDE.md`: mapa de lecciones y fonética de referencia.
3. Lee `lib/data/conversaciones_raw.md`: es la **única** fuente de vocabulario.
4. Lee el comentario de cabecera de **todas** las lecciones existentes de la
   sección (`lib/data/lessons/<sección>/*/lesson_*.dart`) y arma la lista de
   vocabulario ya enseñado. Esa lista es lo único que puede aparecer como
   repaso o como distractor.
5. Abre una lección completa reciente (p. ej. `lesson_02_take_a_seat.dart`)
   como plantilla de formato y comentarios.

## 2. Elegir las palabras nuevas

- **Máximo 5** palabras/expresiones nuevas, sacadas de `conversaciones_raw.md`
  y que no estén ya enseñadas.
- Para cada una: traducción y fonética en español con el formato
  `[ gud MOR-ning ]` (sílaba tónica en mayúsculas).

## 3. Escribir los 20 ejercicios

Sigue exactamente la tabla de 20 ejercicios de `CLAUDE.md` (bloques Repaso →
Palabras nuevas → Consolidación → Diálogo final). Reglas que debes comprobar
en cada ejercicio:

- **01–03 son repaso** de lecciones anteriores (repetición espaciada al abrir).
- **Secuencia escuchar → pronunciar:** cada palabra nueva aparece primero en un
  `escuchar` (palabra sola, `'es_palabra_nueva': true`) seguido de un
  `pronunciacion` con una **oración completa** que la contiene. Nunca
  pronunciar la palabra suelta. Antes de ese par, la palabra no puede aparecer
  en ningún ejercicio.
- **Distractores** (`opciones`, `completar`, `ordenar`, `opciones_barbero`):
  solo vocabulario ya enseñado (lecciones anteriores o ya presentado en esta).
- **Oraciones:** palabra nueva + vocabulario enseñado + palabras gramaticales
  básicas (the, a, on, to, your, my, please, and, for, not, this…) + el nombre
  "Junior". Sin cifras.
- Nunca 2 `escuchar` seguidos; nunca más de 2 del mismo tipo seguidos.
- `pronunciacion`: `respuesta_correcta` = `frase`.
- `ordenar`: `respuesta_correcta` = las `palabras` en orden unidas por espacios.
- `completar`: `frase` con `___` y `respuesta_correcta` dentro de `opciones`.
- Todos llevan `tipo`, `instruccion`, `quien_habla`, `frase`,
  `traduccion_pregunta`, `contexto_es`.
- Contexto real de barbería (lo que dice el barbero "Tú le dices" o el cliente
  "El cliente dice").

## 4. Crear el archivo

- Ruta: `lib/data/lessons/<sección>/<nivel>/lesson_NN_<slug>.dart`.
- Cabecera con: palabras de REPASO por lección y palabras NUEVAS en orden con
  fonética y traducción (igual que las lecciones existentes).
- `const lessonNN<NombreCamel> = Lesson(id: NN, title:, description:, emoji: '💈',
  level: Level.<A1|A2|B1|B2>, descripcionEs:, motivacionEs:, exercises: [...])`.
- Comentario `// ── EJ nn · TIPO ─ ...` encima de cada ejercicio y banners de
  bloque, como en las lecciones existentes.

## 5. Registrar y documentar

1. Importa y añade la constante a `lib/data/barber_zone_data.dart` o
   `lib/data/street_english_data.dart`, en orden.
2. Añade la fila de la lección al mapa de `lib/CLAUDE.md` (y su fonética nueva
   a la tabla de fonética).

## 6. Verificar (no termines sin esto)

1. Comprueba mecánicamente:
   - hay exactamente 20 ejercicios;
   - cada palabra nueva: su primera aparición es un `escuchar` con
     `es_palabra_nueva: true`, seguido de un `pronunciacion` de oración que la
     contiene;
   - ninguna opción/distractor contiene palabras fuera del vocabulario enseñado.
2. Ejecuta `flutter build web 2>&1 | grep -E "error:|Error:" | head -20` y
   corrige hasta que no salga nada.
3. Informa: archivo creado, las palabras nuevas, el total de ejercicios por
   tipo y cualquier regla que no se pudo cumplir y por qué.
