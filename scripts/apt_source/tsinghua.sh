#!/bin/bash
# Kept for old links. Tsinghua's mirror no longer carries Debian buster (GameShell's OS), so this runs
# debian_archive.sh, which picks the fastest mirror that still does (fetched through jsDelivr).
bash <(curl -sL https://cdn.jsdelivr.net/gh/zzxzzk115/GameShell-Scripts@main/scripts/apt_source/debian_archive.sh)
