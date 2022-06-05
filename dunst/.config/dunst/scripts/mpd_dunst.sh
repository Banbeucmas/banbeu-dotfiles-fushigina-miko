#!/usr/bin/env bash
readarray all_lines <<< $(mpc status | sed -e 's/\s\+/ /g') # Normalize spaces
[[ "${#all_lines[@]}" = 1 ]] || {

    readarray -t -d' ' fstline <<< ${all_lines[1]}
    readarray -t -d' ' sndline <<< ${all_lines[2]/:/}

    crossfade="$(mpc crossfade)"
    [[ "${crossfade##*:\ }" -gt 0 ]] && fade="x"
    [[ "${sndline[3]}" == "on" ]] && re="r"
    [[ "${sndline[5]}" == "on" ]] && ran="z"
    [[ "${sndline[7]}" == "on" ]] && sin="s"
    [[ "${sndline[9]}" == "on" ]] && cons="c"

    modes="${re}${ran}${sin}${fade}${cons}"
    [[ "$modes" == "" ]] || modes="$modes | "

    state="${all_lines[1]%%]*}"

    app_name="MPD ${state^^p} | ${fstline[2]} | ${sndline[1]} | ${modes}${fstline[1]##\#}]"
    body="${all_lines[0]}"
}

app=$(command -v dunstify || command -v notify-send) || exit
[[ "$app" =~ "dunstify" ]] && app+=" -r 238401"
$app -a "mpd_notifier" "Now playing:" "$body" -i "$(~/.config/dunst/scripts/mpd_albumcover.sh)"