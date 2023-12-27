#--------------------------------------------------
# Network
#--------------------------------------------------

# Host network config
default_ethernet="$(shell ip token | cut -d\  -f4 | grep -E '^e' | head -n1)"
default_wifi="$(shell ip token | cut -d\  -f4 | grep -E '^w' | head -n1)"

