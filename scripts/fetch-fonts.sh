#!/bin/sh
# Fontshare's license (ITF FFL) allows self-hosting but not redistribution, so the font files stay
# out of this public repo and are fetched from Fontshare at build time into static/fonts/.
set -eu

dest="static/fonts"

# On Netlify, plugins/fonts-cache restores these from the build cache before this runs.
if [ -f "$dest/Satoshi-Variable.woff2" ] && [ -f "$dest/Erode-Variable.woff2" ] && [ -f "$dest/Erode-VariableItalic.woff2" ]; then
  echo "fonts: using existing files in $dest"
  exit 0
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$dest"

fetch() {
  family="$1"; shift
  curl -fsSL "https://api.fontshare.com/v2/fonts/download/$family" -o "$tmp/$family.zip"
  unzip -q -o "$tmp/$family.zip" -d "$tmp/$family"
  for file in "$@"; do
    cp "$tmp/$family"/*/Fonts/WEB/fonts/"$file" "$dest/"
  done
}

fetch satoshi Satoshi-Variable.woff2
fetch erode Erode-Variable.woff2 Erode-VariableItalic.woff2
