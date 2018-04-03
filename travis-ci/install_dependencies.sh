#!/usr/bin/env sh

###########################################################
#
# Travis CI - Install MediaElch dependencies
#
# This script installs all dependencies for MediaElch on
# linux (GCC or clang) and macOS (clang).
#
# Linux builds can use different Qt versions. Set $QT_PPA
# to select a Qt version. For available versions see
# https://launchpad.net/~beineri/
# macOS builds use the latest Qt version available with
# Homebrew (https://brew.sh).
#
###########################################################

# Exit on errors
set -e

if [ -z ${QT+x} ]; then print_error "\$QT is unset"; return 1; fi

# Load utils (color output, folding, etc.)
. "${TRAVIS_BUILD_DIR}/travis-ci/utils.sh"
cd "${TRAVIS_BUILD_DIR}"

print_important "Getting dependencies for building for ${QT} on ${TRAVIS_OS_NAME}"

if [ "${TRAVIS_OS_NAME}" = "linux" ]; then

	if [ -z ${QT_PPA+x} ]; then
		print_error "\$QT_PPA is unset";
		print_error "For valid PPAs see https://launchpad.net/~beineri/"
		return 1;
	fi

	#######################################################
	# Repositories

	print_info "Add repositories + update"
	fold_start "update"
	sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
	sudo add-apt-repository -y ppa:beineri/opt-${QT_PPA}-trusty
	sudo apt-get -qq update
	fold_end

	#######################################################
	# Compiler

	print_info "Updating GCC..."
	fold_start "update_compiler"
	sudo apt-get install -y g++-7 gcc-7
	sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 90
	sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 90
	fold_end

	#######################################################
	# Dependencies

	print_info "Installing Qt packages"
	fold_start "qt_install"
	sudo apt-get install -y ${QT}base ${QT}script ${QT}multimedia ${QT}declarative
	fold_end

	print_info "Installing other dependencies"
	fold_start "other_install"
	sudo apt-get install -y libcurl4-openssl-dev libmediainfo-dev libpulse-dev zlib1g-dev libzen-dev
	fold_end

elif [ "${TRAVIS_OS_NAME}" = "osx" ]; then

	fold_start "download_libraries"
	print_info "Dowload MediaInfoLib sources"
	svn checkout https://github.com/MediaArea/MediaInfoLib/trunk/Source/MediaInfoDLL

	print_info "Dowload ZenLib sources"
	svn checkout https://github.com/MediaArea/ZenLib/trunk/Source/ZenLib

	print_info "Updating homebrew"
	brew update > brew_update.log || {
		print_error "Updating homebrew failed. Error log:";
		cat brew_update.log;
		exit 1;
	}
	print_info "Brewing packages: qt5 media-info"
	brew install qt5 media-info
	fold_end

else
	print_error "Unknown operating system."
	exit 1;
fi

print_important "Successfully installed dependencies"
cd "${TRAVIS_BUILD_DIR}"
