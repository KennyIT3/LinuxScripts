ip -4 addr show eth0 | grep inet | awk '{print "This is IP="$2, "|", "This is Broadcast="$4}'
