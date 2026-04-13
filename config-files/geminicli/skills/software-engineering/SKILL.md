---
name: software-engineering
description: Unified software engineering skill focused on state-machine composition, requirement-based design, and robust development in Nim (Futhark, std/jsffi, Karax, Mummy), Nix (Flakes), Zig (forge), Bun, C, C++, JS, SQL, Typst, D2, and WGSL.
---

# Software Engineering Unified Skill

This skill provides comprehensive guidance for software engineering tasks, emphasizing state-machine composition and clean room design methodologies.

## References Organization

- `references/general/`: General software engineering, state-machine composition, and requirement specification.
- `references/languages/`: Language/Tool-specific best practices.

### Current Modules

#### General Engineering
- **Design Principles & Requirements**: See [references/general/design-principles.md](references/general/design-principles.md)

#### Languages & Tooling
- **Nim**: [references/languages/nim/nim-best-practices.md](references/languages/nim/nim-best-practices.md)
- **Nix**: [references/languages/nix/best-practices.md](references/languages/nix/best-practices.md)
- **C**: [references/languages/c/best-practices.md](references/languages/c/best-practices.md)
- **C++**: [references/languages/cpp/best-practices.md](references/languages/cpp/best-practices.md)
- **JS**: [references/languages/js/best-practices.md](references/languages/js/best-practices.md)
- **SQL (SQLite)**: [references/languages/sql/best-practices.md](references/languages/sql/best-practices.md)
- **Typst**: [references/languages/typst/best-practices.md](references/languages/typst/best-practices.md)
- **D2**: [references/languages/d2/best-practices.md](references/languages/d2/best-practices.md)
- **WGSL**: [references/languages/wgsl/best-practices.md](references/languages/wgsl/best-practices.md)

## Workflow

1. **Phase 1: Analysis (Optional)**: If requested, define Requirements and Design (state-machines).
2. **Phase 2: Build Environment (Nix)**: Use Flakes and Dendritic structure.
3. **Phase 3: Implementation (Nim-driven)**: 
    - Use Nim as build system (compiling C/C++/JS). 
    - Use Zig (forge) for C/C++ compilation. 
    - Use Karax/Mummy for web development. 
    - Use Futhark/jsffi for interop. 
    - Use Bun for JS post-processing.
4. **Phase 4: Infrastructure**: Use Colmena for deployment; Unikraft for target platform.
5. **Phase 5: SQL/Docs/Diagrams**: Use `.sql` for prepared statements; follow template-first workflows for Typst/D2 documentation.
