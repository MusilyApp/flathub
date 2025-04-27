#!/bin/bash


# Convert the archive of the Flutter app to a Flatpak.


# Exit if any command fails
set -e

# Echo all commands for debug purposes
set -x


# No spaces in project name.
projectName=Musily
projectId=app.musily.music
executableName=musily


# ------------------------------- Build Flatpak ----------------------------- #
ls
buildDir=
mkdir -p $projectName
cp -r data/ $projectName
cp -r lib/ $projectName
cp -r musily $projectName

# Copy the portable app to the Flatpak-based location.
mkdir -p /app/bin
cp -r $projectName/* /app/bin
chmod +x /app/bin/$executableName

# Install the icon.
iconDir=/app/share/icons/hicolor/scalable/apps
mkdir -p $iconDir
cp -r $projectId.svg $iconDir/

# Install the desktop file.
desktopFileDir=/app/share/applications
mkdir -p $desktopFileDir
cp -r $projectId.desktop $desktopFileDir/

# Install the AppStream metadata file.
metadataDir=/app/share/metainfo
mkdir -p $metadataDir
cp -r $projectId.metainfo.xml $metadataDir/