#!/usr/bin/env sh

# Binary dir for compilers, etc
BIN_DIR=$(dirname $(which g++))

###########################################################
# Print colors

RED='\033[0;31m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;34m'
NC='\033[0m' # No Color

print_important()
{
	printf '%b' "${BLUE}${1}${NC}\n"
}

print_info() {
	printf '%b' "${LIGHT_BLUE}${1}${NC}\n"
}

print_warning() {
	printf '%b' "${ORANGE}${1}${NC}\n"
}

print_error() {
	printf '%b' "${RED}${1}${NC}\n"
}

###########################################################
# Travis CI folding

TRAVIS_LAST_FOLD=""

fold_start() {
	echo -e "travis_fold:start:$1"
	TRAVIS_LAST_FOLD="$1"
}

fold_end() {
	if [ "$TRAVIS_LAST_FOLD" == "" ]; then
		return
	fi
	echo -e "travis_fold:end:$TRAVIS_LAST_FOLD"
	TRAVIS_LAST_FOLD=""
}
