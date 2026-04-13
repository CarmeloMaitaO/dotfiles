# C++ Best Practices

## Build Orchestration
- Use Nim as the orchestrator for compiling C++ code, replacing `make` or `cmake`.

## Library Constraint
- Use ONLY the C++ Standard Library or host platform APIs. No third-party frameworks.

## Nim Interop
- **Consume Nim**: Expose C++ objects via `extern "C"` interfaces if needed for ABI stability when consuming Nim-exported code.
- **Wrap for Nim**: Use thin C-compatible wrappers (C-style functions) for C++ classes/templates to simplify consumption via Nim's FFI.

## API Showcase
- Provide minimal, standalone C++ snippets to demonstrate usage of exported functionality.
