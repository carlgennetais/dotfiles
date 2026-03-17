#!/bin/bash

case "$(hostname)" in
carl-precision)
  # exit immediately if already in $PATH
  type lpass >/dev/null 2>&1 && exit
  brew install lastpass-cli
  ;;
bluefin-desktop)
  type bw >/dev/null 2>&1 && exit
  # TODO: use bw flatpak cli instead ?
  brew install bitwarden-cli
  ;;
*)
  echo "this host is not supported by this script"
  exit 1
  ;;
esac
