#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER "   "

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
    X("🌐 ", "echo $(xset -q|grep LED| awk '{ if (substr($10,5,1) == 1)  print \"RU\"; else print \"EN\"; }')", 1, 5) \
    X("", "amixer get Master | grep -q \"\\[off\\]\" && echo \" Muted\" || amixer get Master | awk -F\"[][]\" '/%/ {printf \"  %s\", $2; exit}'", 1, 2) \
    X("", "echo  $(date '+%H:%M - 󰃰 %d.%m')", 5, 0)

#endif  // CONFIG_H

//     X(" ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g", 5, 9)
