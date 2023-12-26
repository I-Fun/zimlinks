#!/bin/bash
## Variable
packagename="zcs-10.0.0_GA_0001.UBUNTU20_64.20231003093215.tgz"
downloadpath="https://github.com/I-Fun/zimlinks/raw/main"
zimbraversion="Zimbra

## Dependency
BLA_modern_metro=( 0.15 ▰▱▱▱▱▱▱ ▰▰▱▱▱▱▱ ▰▰▰▱▱▱▱ ▱▰▰▰▱▱▱ ▱▱▰▰▰▱▱ ▱▱▱▰▰▰▱ ▱▱▱▱▰▰▰ ▱▱▱▱▱▰▰ ▱▱▱▱▱▱▰ ▱▱▱▱▱▱▱ ▱▱▱▱▱▱▱ ▱▱▱▱▱▱▱ ▱▱▱▱▱▱▱ )
declare -a BLA_active_loading_animation

BLA::play_loading_animation_loop() {
  while true ; do
    for frame in "${BLA_active_loading_animation[@]}" ; do
      printf "\r%s" "${frame}"
      sleep "${BLA_loading_animation_frame_interval}"
    done
  done
}

BLA::start_loading_animation() {
  BLA_active_loading_animation=( "${@}" )
  # Extract the delay between each frame from array BLA_active_loading_animation
  BLA_loading_animation_frame_interval="${BLA_active_loading_animation[0]}"
  unset "BLA_active_loading_animation[0]"
  tput civis # Hide the terminal cursor
  BLA::play_loading_animation_loop &
  BLA_loading_animation_pid="${!}"
}

BLA::stop_loading_animation() {
  kill "${BLA_loading_animation_pid}" &> /dev/null
  printf "\n"
  tput cnorm # Restore the terminal cursor
}

###### ADD FUNCTION ############
remove_line() {
  tput cuu1           # Move cursor up one line
  tput el              # Clear the line
}

join_line() {
  tput cuu1           # Move cursor up one line
  tput ich 1

measure_time() {
    start_time=$(date +%s)
    eval "$1"
    end_time=$(date +%s)
    et=$((end_time - start_time))       #Elapsed Time
    tet=$((tet + et))                   #Total Elapsed Time
}

timesec() {
    totalSeconds=$1;
    seconds=$((totalSeconds%60));
    minutes=$((totalSeconds/60%60));
    hours=$((totalSeconds/60/60%24));
    days=$((totalSeconds/60/60/24));
    (( $days > 0 )) && printf '%d days ' $days;
    (( $hours > 0 )) && printf '%d hours ' $hours;
    (( $minutes > 0 )) && printf '%d minutes ' $minutes;
    (( $days > 0 || $hours > 0 || $minutes > 0 )) && printf 'and ';
    printf '%d seconds\n' $seconds;
}

### Start Script 
wget -i https://github.com/I-Fun/zimlinks/raw/main/Zimbra%2010/ubuntu20/dlist.txt
