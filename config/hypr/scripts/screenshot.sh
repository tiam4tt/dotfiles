#!/bin/bash

# Screenshot script for Hyprland
# Handles partial and full screenshots with proper abortion detection and no cursor

PICTURES_DIR="$HOME/Pictures/Screenshots"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

# Create screenshots directory if it doesn't exist
mkdir -p "$PICTURES_DIR"

# Function to show notification
notify() {
    local message="$1"
    hyprctl notify 5 4000 0 "fontsize:16 $message"
}

# Function to take partial screenshot (area selection)
partial_screenshot() {
    local selection
    
    # Use slurp to select area, capture the coordinates
    selection=$(slurp 2>/dev/null)
    
    # Check if slurp was successful (user didn't abort)
    if [ $? -eq 0 ] && [ -n "$selection" ]; then
        # Take screenshot of selected area without cursor
        local filename="$PICTURES_DIR/partial-screenshot-$TIMESTAMP.png"
        if grim -g "$selection" -c "$filename"; then
            # Copy to clipboard using wl-copy with image type
            cat "$filename" | wl-copy --type image/png
            notify "Partial screenshot saved to clipboard and $PICTURES_DIR"
        else
            notify "Failed to take partial screenshot"
        fi
    else
        notify "Screenshot cancelled"
    fi
}

# Function to take full monitor screenshot
full_screenshot() {
    local selection
    
    # Use slurp to select monitor
    selection=$(slurp -o 2>/dev/null)
    
    # Check if slurp was successful (user didn't abort)
    if [ $? -eq 0 ] && [ -n "$selection" ]; then
        # Take screenshot of selected monitor without cursor
        local filename="$PICTURES_DIR/screenshot-$TIMESTAMP.png"
        if grim -g "$selection" -c "$filename"; then
            notify "Screenshot saved to $PICTURES_DIR"
        else
            notify "Failed to take screenshot"
        fi
    else
        notify "Screenshot cancelled"
    fi
}

# Main logic based on argument
case "$1" in
    "partial")
        partial_screenshot
        ;;
    "full")
        full_screenshot
        ;;
    *)
        echo "Usage: $0 {partial|full}"
        echo "  partial - Take a partial screenshot with area selection"
        echo "  full    - Take a full monitor screenshot"
        exit 1
        ;;
esac