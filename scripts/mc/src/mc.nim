import std/[
  parseopt,
  paths,
  dirs,
  os,
  osproc
]

proc help(abnormal: bool) =
  echo "Just pass a path"
  if abnormal:
    quit(QuitFailure)
  else:
    quit(QuitSuccess)

proc version() =
  echo "version: 0.1.0"

proc convert(file, iext, acodec, container: string) =
  discard execProcess(
    "ffmpeg",
    args = ["-n", "-i", file & iext, "-c:a", acodec, file & container],
    options = {poUsePath, poEchoCmd}
  )

proc enumerate(path: Path, iext: string): seq[string] =
  var
    list: seq[string]
    fileAux: tuple[dir, name: Path, ext: string]
  for file in walkDir(path):
    fileAux = splitFile(file.path)
    if file.kind == pcFile and fileAux.ext == iext:
      list.add(
        $(fileAux.dir / fileAux.name)
      )
  return list

proc cycle(path: Path, iext, acodec, container: string) =
  var
    list: seq[string] = enumerate(path, iext)
  for file in list:
    convert(file, iext, acodec, container)
    
var
  args = initOptParser(
    shortNoVal = {'h', 'v'},
    longNoVal = @["help", "version"]
  )
  path: Path
  iext: string # input extension
  acodec: string # target audio codec
  container: string # target container format

for kind, key, val in args.getopt():
  case kind
  of cmdArgument:
    path = cast[Path](key)
    if path.dirExists:
      continue
    else:
      help(true)
  of cmdLongOption, cmdShortOption:
    case key
    of "help", "h":
      help(false)
    of "version", "v":
      version()
    of "iext", "i":
      iext = "." & val
    of "acodec", "a":
      case val
      of "opus":
        acodec = "libopus"
      else:
        help(true)
    of "container", "c":
      case val
      of "mkv", "mka", "matroska":
        container = ".mka"
      else:
        help(true)
  of cmdEnd:
    break

cycle(path, iext, acodec, container)
