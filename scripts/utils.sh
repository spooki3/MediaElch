#!/usr/bin/env sh

###########################################################
# Print colors

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;34m'
NC='\033[0m' # No Color

msg_important()
{
	printf '%b' "${BLUE}${1}${NC}\n"
}

msg_success() {
	printf '%b' "${GREEN}${1}${NC}\n"
}

msg_info() {
	printf '%b' "${LIGHT_BLUE}${1}${NC}\n"
}

msg_warning() {
	printf '%b' "${ORANGE}${1}${NC}\n"
}

msg_error() {
	printf '%b' "${RED}${1}${NC}\n"
}
