#--------------------------------------------------
# Time
#--------------------------------------------------

# Date / Time
DATE=$(shell date -I)
DATETIME=$(shell date '+%Y-%m-%d %H:%M:%S')
TIME=$(shell date -Ins)
ISO-8601=$(shell date -Ins)
TIMESTAMP=$(shell date +%Y%m%d%H%M%S)
LONG_TIMESTAMP=$(shell date +%Y-%m-%d_%H-%M-%S)
EPOCH=$(shell date +%s)
DAY=$(shell LANG=C date +%A)

