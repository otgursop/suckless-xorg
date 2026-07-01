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
    X("", "~/.local/sl/dwmblocks-async/scripts/weather-status.sh", 600, 0) \
    X("🌐 ", "~/.local/sl/dwmblocks-async/scripts/layout-status.sh", 1, 1) \
    X("", "~/.local/sl/dwmblocks-async/scripts/volume-status.sh", 5, 2) \
    X(" ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g", 5, 3) \
    X("", "~/.local/sl/dwmblocks-async/scripts/vpn-status.sh", 2, 4) \
    X("", "~/.local/sl/dwmblocks-async/scripts/network-status.sh", 5, 5) \
    X("", "echo  $(date '+%H:%M - 󰃰 %d.%m')", 5, 6)

#endif  // CONFIG_H
