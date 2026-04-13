# Gemini CLI Configuration for Dotfiles Repository

This repository serves as a centralized management hub for system configurations, development tools, and hobby projects across Linux and Windows environments.

## Repository Structure & Purpose

- `code/`: Contains hobby projects, automation scripts, and utility code (e.g., Advent of Code, game automation).
- `config-files/`: Managed configuration files for various applications, including Gemini CLI skills, terminal emulators (Rio), text editors (Helix), and system-level configurations.
- `devshells/`: Nix-based development environment definitions for consistent tooling.
- `dist/`: Build artifacts (e.g., packaged `.skill` files).
- `hosts/`: NixOS and Nix-on-Droid configurations, modules, and hardware-specific settings.

## Skill Management

Gemini CLI skills are maintained within `config-files/geminicli/skills/`. To ensure these are available globally, a symbolic link connects the user's `~/.gemini/skills/` directory to this repository's skill path.

### Development Workflow
1. **Editing**: Modify configuration files and skill definitions directly within this repository.
2. **Deployment**: Changes to Nix configurations and system files are applied via standard Nix workflows (e.g., `nixos-rebuild`, `home-manager`).
3. **Skills**: After modifying or creating a `.skill` file, run `/skills reload` in an active Gemini CLI session to apply updates.
