# Build

MediaElch can be build using `qmake`. Using [QtCreator][qt] is supported and advised.

Supported platforms:
 - [Linux](#linux)
 - [Mac](#mac)
 - [Windows](#windows)

## Linux

Linux build instructions are available for:
 - Ubuntu 16.04 LTS and 18.04 LTS
 - openSUSE Leap 42.3 

### Ubuntu

#### Dependencies

```sh
# [Optional] Modern GCC:
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install g++-7 gcc-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 90
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 90

# Build tools and other libraries
sudo apt install build-essential git libcurl4-openssl-dev
sudo apt install libmediainfo-dev

# Qt (alternative: download and install Qt from its official website)
sudo apt install qt5-default qtmultimedia5-dev qtscript5-dev qtdeclarative5-dev
```

Following packages are only required for Ubuntu 16.04 but not for 18.04.

```
sudo apt install qtdeclarative5-controls-plugin qtdeclarative5-models-plugin
```

#### Build
```sh
git clone https://github.com/Komet/MediaElch.git && cd MediaElch
mkdir build && cd $_
qmake ..
make -j4
```

### openSUSE

#### Dependencies
Follow the instructions on https://wiki.qt.io/Install_Qt_5_on_openSUSE  
Select the latest stable Qt version (e.g. 5.10.1) with following components:
 - Desktop gcc 64-bit
 - Qt Script (Deprecated)

```sh
# Install development tools
sudo zypper install --type pattern devel_basis
# Install other dependencies
sudo zypper install libmediainfo0 libmediainfo-devel libpulse-devel
# Install a newer version of GCC (Leap 42.3 uses GCC 4.8.5)
sudo zypper install gcc7 gcc7-c++
```

To be able to build MediaElch using the command line, don't forget to add the `bin` directory of the previously installed Qt version to your `$PATH`. For example add following to your `~/.bashrc`:

```sh
export PATH=$PATH:$HOME/Qt/5.10.1/gcc_64/bin
```

#### Build
```sh
git clone https://github.com/Komet/MediaElch.git && cd MediaElch
mkdir build && cd $_
qmake ..
make -j4
```

## Mac

# Dependencies
Install XCode (e.g. through the [Mac App Store](https://itunes.apple.com/de/app/xcode/id497799835))
Alternatively only install the XCode Command Line Tools through Terminal (`xcode-select --install`)

media-info (needed for streamdetails) e.g. Install through [Homebrew](https://brew.sh/)

### Commandline build
Install [Homebrew](https://brew.sh/).

```sh
# Install tools and dependencies
brew install subversion qt5 media-info

# Optional : git is already included with XCode
brew install git

# Clone MediaElch
git clone https://github.com/Komet/MediaElch.git && cd MediaElch

# Download necessary headers
svn checkout https://github.com/MediaArea/MediaInfoLib/trunk/Source/MediaInfoDLL
svn checkout https://github.com/MediaArea/ZenLib/trunk/Source/ZenLib

# Build MediaElch
mkdir build && cd $_
qmake ..
make -j4
```
### QTCreator build
Install the latest version of Qt [qt]: https://www.qt.io/download.

Install Qt with at least the following options : 
- macOS
- Scripts (Deprecated
- QT Creator

# Clone MediaElch
git clone https://github.com/Komet/MediaElch

# Download necessary headers
git clone https://github.com/MediaArea/MediaInfoLib
Copy the entire Source/MediaInfoDLL/ dir (not just its contents) into the MediaElch source dir.
git clone https://github.com/MediaArea/ZenLib
Copy the entire Source/ZenLib/ dir (not just its contents) into the MediaElch source dir.

# Build
Open the MediaElch project using QtCreator, configure it and click "Run" (`Strg+R`).

- Assuming QT Creator is installer run it ( /home/you/QT<version>/QT Creator.app )
- Open Project and bowse to and open MediaElch/MediaElch.pro
- Configure build configuration as release
- Build project " MediaElch" (`Cmd+R`)

## Windows

### Dependencies

#### Qt
Download the [Qt online installer][qt]. Run it and select the latest Qt version for installation (e.g. `Qt 5.10.1`).
Check that following components are selected:
 - MinGW 5.3.0 32 bit
 - Qt Script (Deprecated)

Select "MinGW 5.3.0" in section `Tools`.

#### Other Libraries
 1. Download precompiled [MediaInfo](https://mediaarea.net/de/MediaInfo/Download/Windows) (DLL)
 2. Download [MediaInfoLib](https://github.com/MediaArea/MediaInfoLib).  
    Copy the folder `Source/MediaInfoDLL` to `path/to/MediaElch/MediaInfoDLL`
 3. Download [ZenLib](https://github.com/MediaArea/ZenLib).  
    Copy the folder `Source/ZenLib` to `path/to/MediaElch/ZenLib`

### Build
Open the MediaElch project using QtCreator, configure it and click "Run" (`Strg+R`).

[qt]: https://www.qt.io/download
