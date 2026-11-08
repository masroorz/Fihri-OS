#!/bin/sh
set -eu

product=$(sudo -n dmidecode -s system-product-name 2>/dev/null || dmidecode -s system-product-name 2>/dev/null || true)
[ "$product" = "MacBookPro10,1" ]
