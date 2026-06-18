#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER " | "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 0

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X) \
    X("🌐 ", "echo $(xset -q|grep LED| awk '{ if (substr($10,5,1) == 1)  print \"RU\"; else print \"EN\"; }')", 1, 1) \
    X("", "amixer get Master | awk -F'[][]' '/%/ {v=$2; for(i=1;i<=NF;i++) if($i==\"on\"||$i==\"off\") s=$i; if(s==\"off\") print \" \" v \" [off]\"; else print \"  \" v; exit}'", 5, 2) \
    X(" ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g", 5, 9) \
    X("", "./scripts/vpn-status.sh", 2, 0) \
    X("", "./scripts/network-status.sh", 5, 0) \
    X("", "echo  $(date '+%H:%M - 󰃰 %d.%m')", 5, 0)

#endif  // CONFIG_H
