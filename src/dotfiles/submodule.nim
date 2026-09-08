type
  Registries* = enum
    CHOCOLATEY,
    TERMUX
  RegistryPkg* = object
    registry: Registries
    pkg: string
  Package* = object
    name: string
    sources: seq[RegistryPkg]

proc newRegistryPkg*(registry: Registries, pkg: string): RegistryPkg =
  return RegistryPkg(registry: registry, pkg: pkg)

proc newPackage*(name: string, sources: varargs[RegistryPkg]): Package =
  return Package(name: name, sources: sources)

const packages: seq[Package] = @[
  newPackage(
    "7zip",
    newRegistryPkg(CHOCOLATEY, "7zip"),
    newRegistryPkg(TERMUX, "7zip"),
  ),
  newPackage(
    "Alacritty",
    newRegistryPkg(CHOCOLATEY, "alacritty")
  ),
  newPackage(
    "Git",
    newRegistryPkg(CHOCOLATEY, "git"),
    newRegistryPkg(TERMUX, "git")
  ),
  newPackage(
    "OpenSSH",
    newRegistryPkg(CHOCOLATEY, "openssh"),
    newRegistryPkg(TERMUX, "openssh")
  ),
  newPackage(
    "GNUPG",
    newRegistryPkg(CHOCOLATEY, "gnupg"),
    newRegistryPkg(TERMUX, "gnupg")
  ),
  newPackage(
    "Helix",
    newRegistryPkg(CHOCOLATEY, "helix"),
    newRegistryPkg(TERMUX, "helix")
  ),
  newPackage(
    "Nim",
    newRegistryPkg(CHOCOLATEY, "nim"),
    newRegistryPkg(TERMUX, "nim")
  ),
  newPackage(
    "NodeJS",
    newRegistryPkg(CHOCOLATEY, "nodejs"),
    newRegistryPkg(TERMUX, "nodejs")
  ),
  newPackage(
    "Nushell",
    newRegistryPkg(CHOCOLATEY, "nushell"),
    newRegistryPkg(TERMUX, "nushell")
  ),
  newPackage(
    "Starship",
    newRegistryPkg(CHOCOLATEY, "starship"),
    newRegistryPkg(TERMUX, "starship")
  ),
  newPackage(
    "Zig",
    newRegistryPkg(CHOCOLATEY, "zig"),
    newRegistryPkg(TERMUX, "zig")
  ),
  newPackage(
    "Brave",
    newRegistryPkg(CHOCOLATEY, "brave")
  ),
  newPackage(
    "Okular",
    newRegistryPkg(CHOCOLATEY, "okular")
  ),
  newPackage(
    "Curl",
    newRegistryPkg(CHOCOLATEY, "curl"),
    newRegistryPkg(TERMUX, "curl")
  ),
  newPackage(
    "Aria2",
    newRegistryPkg(CHOCOLATEY, "aria2c"),
    newRegistryPkg(TERMUX, "aria2c")
  ),
  newPackage(
    "YT-DLP",
    newRegistryPkg(CHOCOLATEY, "yt-dlp"),
    newRegistryPkg(TERMUX, "yt-dlp")
  ),
  newPackage(
    "VLC",
    newRegistryPkg(CHOCOLATEY, "vlc")
  ),
  newPackage(
    "Typst",
    newRegistryPkg(CHOCOLATEY, "typst"),
    newRegistryPkg(TERMUX, "typst")
  ),
  newPackage(
    "Persepolis",
    newRegistryPkg(CHOCOLATEY, "persepolis")
  ),
  newPackage(
    "Tor Browser",
    newRegistryPkg(CHOCOLATEY, "tor-browser")
  ),
]
