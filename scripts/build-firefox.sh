#!/bin/sh
# Empaqueta el tema de Firefox en dist/hypr-palette-<versión>.zip, listo para subir a addons.mozilla.org.
# La versión sale de firefox/manifest.json: súbela antes de enviar una versión nueva.
set -eu

root="$(cd "$(dirname "$0")/.." && pwd)"
version=$(python3 -c 'import json, sys; print(json.load(open(sys.argv[1]))["version"])' "$root/firefox/manifest.json")
out="$root/dist/hypr-palette-$version.zip"

mkdir -p "$root/dist"
rm -f "$out"
cd "$root/firefox"
bsdtar -a -cf "$out" manifest.json
echo "$out"
