#!/bin/bash

f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
d=$'\e[1m'
t=$'\e[0m'
v=$'\e[7m'

# Items

os=os:
for osfile in /etc/os-release /usr/lib/os-release; do
    [ -f "$osfile" ] && . "$osfile" && break
done
osname="$ID"

wm=wm:
wmname="$(xprop -id $(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}') -notype -f _NET_WM_NAME 8t | grep "WM_NAME" | cut -f2 -d \")"

sh=sh:
shell=$(basename $SHELL)

# (\ /)
# ( · ·)
# c(")(")

# (\ /)
# ( . .)
# c(")(")

tput clear
cat << EOF

   (\ /)     $os  $t$osname
   ( $d. .$t)    $wm  $t$wmname
   c($f1"$t)($f1"$t)   $sh  $t$shell

EOF
