#!/bin/bash
# Point apt at a working Debian buster archive (GameShell's OS is Debian buster, which Debian has moved to its
# archive; most mirrors, Tsinghua and USTC included, no longer carry it). After connecting over SSH, run:
#   bash <(curl -sL https://raw.githubusercontent.com/zzxzzk115/GameShell-Scripts/main/scripts/apt_source/debian_archive.sh)
# Where GitHub is unreliable (e.g. mainland China):
#   bash <(curl -sL https://cdn.jsdelivr.net/gh/zzxzzk115/GameShell-Scripts@main/scripts/apt_source/debian_archive.sh)
# The fastest of the mirrors below is used; set APT_MIRROR to choose one yourself.
set -e

MIRRORS="mirrors.aliyun.com/debian-archive mirrors.huaweicloud.com/debian-archive archive.debian.org"

# HTTPS needs CA certificates; without them use plain HTTP (apt still checks the archive's signatures)
if [ -s /etc/ssl/certs/ca-certificates.crt ]; then SCHEME=https; else SCHEME=http; fi

# fastest mirror: time the first 256 KB of buster's armhf package list (6 s per try)
pick_mirror() {
  local best="" best_speed=0 m out code size speed
  if [ -n "${APT_MIRROR:-}" ]; then echo "$APT_MIRROR"; return 0; fi
  echo "Testing mirrors..." >&2
  for m in $MIRRORS; do
    out=$(curl -sL -r 0-262143 -m 6 -o /dev/null -w '%{http_code} %{size_download} %{speed_download}' \
      "$SCHEME://$m/debian/dists/buster/main/binary-armhf/Packages.gz" 2>/dev/null || true)
    read -r code size speed <<< "$out"
    size=${size%%.*}; speed=${speed%%.*}
    case "$code" in 200|206) ;; *) speed=0 ;; esac
    [ "${size:-0}" -ge 65536 ] || speed=0
    printf '  %-42s %6s KB/s\n' "$m" "$(( ${speed:-0} / 1024 ))" >&2
    if [ "${speed:-0}" -gt "$best_speed" ]; then best_speed=${speed:-0}; best=$m; fi
  done
  if [ "$best_speed" -eq 0 ]; then echo "Could not reach any mirror. Check the network, or set APT_MIRROR." >&2; return 1; fi
  echo "Using $best" >&2
  echo "$best"
}

MIRROR=$(pick_mirror)
BASE="$SCHEME://$MIRROR"

# back up the current list once, then write the new one
[ -f /etc/apt/sources.list.bak ] || sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo tee /etc/apt/sources.list > /dev/null <<LIST
# Debian buster (archived), from $MIRROR. Source mirrors are commented out to speed up apt update.
deb $BASE/debian/ buster main contrib non-free
# deb-src $BASE/debian/ buster main contrib non-free
deb $BASE/debian/ buster-updates main contrib non-free
# deb-src $BASE/debian/ buster-updates main contrib non-free
deb $BASE/debian/ buster-backports main contrib non-free
# deb-src $BASE/debian/ buster-backports main contrib non-free
deb $BASE/debian-security/ buster/updates main contrib non-free
# deb-src $BASE/debian-security/ buster/updates main contrib non-free
LIST

# update and upgrade packages
sudo apt-get update -y
sudo apt-get upgrade -y
