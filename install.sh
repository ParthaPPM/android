#!/bin/bash

# setting variables
AOSP_ROOT_DIR="aosp"

# creating the directory tree
mkdir ${AOSP_ROOT_DIR} bin bin/tools

# installing the required packages
echo "Installing required packages..."
sudo apt install rsync zip curl wget libncurses5 -y
curl https://storage.googleapis.com/git-repo-downloads/repo > ./bin/tools/repo && chmod a+rx ./bin/tools/repo
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip && unzip -q -d ./bin platform-tools-latest-linux.zip && rm platform-tools-latest-linux.zip

# downloading the AOSP
echo "Downloading the AOSP..."
cd ${AOSP_ROOT_DIR}
../bin/tools/repo init -u https://android.googlesource.com/platform/manifest -b main
../bin/tools/repo sync
cd ..

# Adding to git
echo "Adding files to git..."
git add .
git commit -m "AOSP downloaded"
