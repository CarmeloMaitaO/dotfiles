# JavaScript Best Practices

## Build Orchestration
- Use Nim as the orchestrator for compiling/transpiling JS code, replacing `make` or `cmake`.
- Use **Bun** for post-processing and optimization of Nim-generated JS.

## Library Constraint
- Use ONLY standard Web APIs or Node.js built-in modules (`fs`, `path`, `os`, etc.). No npm dependencies.

## Nim Interop
- **Consume Nim**: Compile Nim to JS and utilize `std/jsffi` to import/export functionality reliably.
- **Wrap for Nim**: Design JS modules with standard export patterns that map easily to Nim's `import` or `proc` declarations.

## API Showcase
- Provide minimal, standalone JS snippets to demonstrate usage of exported functionality.
