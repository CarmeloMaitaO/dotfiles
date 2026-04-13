# Nim Best Practices

## Build Orchestration
- Use Nim (via nimble/task files) as the primary build orchestration tool to compile C, C++, and JS code, replacing traditional tools like `make`, `cmake`, or `gradle`.

## Compiler & Interop
- **Zig (Forge)**: Use the `forge` library by `daylinmorgan` as the C/C++ compiler for Nim projects.
- **FFI**:
    - **C Bindings**: Use **Futhark**.
    - **JS Bindings**: Use **`std/jsffi`**.

## Frameworks & Libraries
- **SPA Development**: Use **Karax**.
- **Server/Networking**: Use **Mummy** for HTTP and WebSockets.

## Testing & Error Handling
- **Testing**: Prioritize unit tests.
- **Error Handling**: Use sparingly. Define error states within the state-machine only if central to API behavior; otherwise, lean on Nim standard reporting.
