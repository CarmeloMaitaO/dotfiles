# Gemini CLI Configuration for Dotfiles Repository

This directory (`.gemini/`) and its contents are part of the dotfiles repository, specifically managing configurations for the Gemini Command Line Interface (CLI).

## Skills Management

Gemini CLI skills are defined and managed as configuration files directly within this repository to allow for version control and consistent deployment across desktop environments.

**Source Location:**
All Gemini CLI skill definitions are located under:
`config-files/geminicli/skills/`

Each skill is represented by a subdirectory containing:
*   `skill.toml`: Metadata and configuration for the skill (e.g., model, temperature, top_p, name).
*   `main.md`: The main content and prompt for the skill.

## Global Access

To make these repository-managed skills available globally to the Gemini CLI, a symbolic link has been established. Your global Gemini CLI configuration directory (`~/.gemini/skills`) is symlinked to the skills directory within this repository:

`~/.gemini/skills` points to `/home/chiguire/Documents/Projects/dotfiles/config-files/geminicli/skills`

This setup ensures that any Gemini CLI command executed will use the skills defined and maintained in this dotfiles repository.

## Editing Skills

Skills should be edited directly in their source location within this repository (`config-files/geminicli/skills/<skill_name>/`). Changes made here will automatically reflect in your global Gemini CLI usage due to the symbolic link.

## Default Model

All skills configured in this repository are currently set to use the `gemini:gemini-flash` model as their default. This can be modified per skill by editing its respective `skill.toml` file.
