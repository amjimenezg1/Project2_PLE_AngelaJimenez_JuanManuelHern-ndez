# Proyecto 2 PLE - VeriLang

**Angela Maria Jimenez** - 202210989  
**Juan Manuel Hernández** - 202412958

---

## Descripción

Implementación del lenguaje VeriLang usando Rascal. El proyecto incluye la sintaxis concreta con syntax highlighting y el árbol de sintaxis abstracta (AST).

---

## Estructura del proyecto
project2ple/
├── META-INF/
│   └── RASCAL.MF
├── instance/
│   └── spec1.veri        # Ejemplo del lenguaje
└── src/main/rascal/
    ├── Syntax.rsc         # Gramática concreta + syntax highlighting
    ├── AST.rsc            # Árbol de sintaxis abstracta
    ├── Plugin.rsc         # Plugin para VS Code
    └── Main.rsc           # Punto de entrada para probar
    ---

## Cambios respecto al Proyecto 1

- Se eliminó `primaryParen` de `Primary` en la gramática para resolver ambigüedades con `OperatorApplication`, ya que ambos usaban paréntesis.
- Se cambió `Expression` de `Primary (InfixOperator Primary)*` a una definición recursiva `Expression InfixOperator Expression` para que `implode` pudiera generar el AST correctamente.

---

## Cómo ejecutar

### Syntax highlighting
1. Abrir `Plugin.rsc`
2. Hacer clic en **Run in new Rascal Terminal** encima del `main()`
3. Esperar que la barra azul termine de cargar
4. Abrir `instance/spec1.veri` para ver el highlighting

### Probar el AST
1. Abrir `Main.rsc`
2. Hacer clic en **Run in new Rascal Terminal** encima del `main()`
3. Escribir `main();` en el terminal donde ejecutara el ejemplo de instancia (spec1.veri)

