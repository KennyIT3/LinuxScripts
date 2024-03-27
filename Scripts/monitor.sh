#!/bin/bash

# Monitor storage
df -h

# Monitor CPU
top -n 1 -b | head -n 12

# Monitor memory
free -m