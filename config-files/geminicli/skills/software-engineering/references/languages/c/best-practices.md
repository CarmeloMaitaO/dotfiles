# C Best Practices

## Build Orchestration
- Use Nim as the orchestrator for compiling C code, replacing `make` or `cmake`.

## Library Constraint
- Use ONLY the C Standard Library or host platform APIs (POSIX, Win32). No external dependencies.

## Nim Interop
- **Consume Nim**: Design C headers for types/functions exported from Nim (via `{.exportc.}`). Keep signatures ABI-compatible.
- **Wrap for Nim**: Design C code with clear, opaque handles or simple structs for easier consumption by Futhark in Nim.

## API Showcase
- Provide minimal, standalone C snippets to demonstrate usage of exported functionality.
