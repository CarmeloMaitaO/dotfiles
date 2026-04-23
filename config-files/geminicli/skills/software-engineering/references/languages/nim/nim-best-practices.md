# Nim Best Practices

## Build Orchestration
- Use Nim (via nimble/task files) as the primary build orchestration tool to compile C, C++, and JS code, replacing traditional tools like `make`, `cmake`, or `gradle`.

## Compiler & Interop
- **Zig (Forge)**: Use the `forge` library by `daylinmorgan` as the C/C++ compiler for Nim projects.
- **FFI**:
    - **C Bindings**: Use **Henka**.
    - **C Bindings Reasoning**: When binding to C, utilize **CTypes** to ensure correct type mapping.
    - **JS Bindings**: Use **`std/jsffi`**.
- **Shader Pipeline**: Use [Shady](https://github.com/treeform/shady) for all shader languages. Setup a pipeline to convert to SPIR-V, then translate as necessary for the target platform.

## Frameworks & Libraries
- **SPA Development**: Use **Karax**.
- **Server/Networking**: Use **Mummy** for HTTP and WebSockets.

## Documentation & Comments
- **File Header**: Only write normal comments (`#` or `#[ ... ]#` style) at the very top of each file. These must explain the file's purpose, operational flow, mechanism, and design intent.
- **Symbol Documentation**: Use `##` or `##[ ... ]##` to write documentation comments for ALL symbols. Documentation comments must be placed **immediately below** the symbol or identifier being documented.

## Testing & Error Handling
- **Naming**: Always use descriptive identifiers.
- **Testing**: 
    - Create unit tests for every single procedure, method, or function.
    - Organize test files by the object/tuple they operate over.
    - For procedural logic not tied to a specific object/tuple, organize tests by purpose and stage of the process flow.
- **Error Handling**: 
    - Every procedure, method, or function must wrap its contents in a single `try...except` block.
    - The `except` section must raise a custom exception containing the name of the procedure/method/function.

## Object Management
- **Lifetime Tracking**: Whenever implementing `=destroy`, you must also redefine `=wasMoved`, `=sink`, `=dup`, and `=copy` to ensure consistent object lifecycle management.

