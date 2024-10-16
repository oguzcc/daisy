#!/bin/bash

PUBSPEC_FILE="pubspec.yaml"

# Check if pubspec.yaml exists
if [ ! -f "$PUBSPEC_FILE" ]; then
  echo "Error: $PUBSPEC_FILE not found!"
  exit 1
fi

PACKAGE_NAME=$(grep '^name:' $PUBSPEC_FILE | awk '{print $2}')
COMPANY_NAME=$(grep '^company_name:' $PUBSPEC_FILE | awk '{print $2}')
PACKAGE_VERSION=$(grep '^version:' $PUBSPEC_FILE | awk '{print $2}')
DATENOWTIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Ensure all required variables are set
if [ -z "$PACKAGE_NAME" ] || [ -z "$PACKAGE_VERSION" ]; then
  echo "Error: PACKAGE_NAME or PACKAGE_VERSION not found in $PUBSPEC_FILE"
  exit 1
fi

if [ -z "$COMPANY_NAME" ]; then
  COMPANY_NAME="default_company_name" # Default nickname if not found
fi

echo "PACKAGE_NAME: ${PACKAGE_NAME}"
echo "PACKAGE_VERSION: ${PACKAGE_VERSION}"
echo "CI_PROJECT_NAME: ${CI_PROJECT_NAME}"
echo "CI_PROJECT_DIR: ${CI_PROJECT_DIR}"
echo "SONAR_USER_HOME: ${SONAR_USER_HOME}"
echo "GIT_DEPTH: ${GIT_DEPTH}"
echo "COMPANIES: ${COMPANIES}"
echo "BRANCH_LIST: ${BRANCH_LIST}"

# Flutter path
export PATH="/Users/Shared/flutter/bin:$PATH"
export PATH="/usr/bin/ruby:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin/pod:$PATH"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

echo "PATH: $PATH"

echo "Pod version:"
pod --version

# Check Ruby and Flutter installations
if ! ruby -v > /dev/null 2>&1; then
  echo "Error: Ruby is not installed or not in PATH"
  exit 1
fi

if ! which flutter > /dev/null 2>&1; then
  echo "Error: Flutter is not installed or not in PATH"
  exit 1
fi

flutter --version

# GitLab repository access
#echo "Step 1: Cleaning"
#flutter clean

echo "Step 2: Getting packages"
#flutter pub get

echo "Step 3: Building"

cd ios || { echo "Error: ios directory not found"; exit 1; }

echo "Current directory: $PWD"

echo "HOME -> $HOME"
echo "PWD -> $PWD"
echo "whoami -> $(whoami)"


# Install pods
echo "Running pod install..."
pod install  || { echo "Pod install failed"; exit 1; }

cd ..

# Build the iOS IPA
if ! flutter build ipa --release; then
  echo "Error: Flutter build failed"
  exit 1
fi

# Check if IPA file was generated
IPA_PATH="build/ios/ipa/${PACKAGE_NAME}.ipa"
if [ ! -f "$IPA_PATH" ]; then
  echo "Error: IPA file not found at $IPA_PATH"
  exit 1
fi

# Move and rename the IPA file
DEST_IPA="${DATENOWTIMESTAMP}_${COMPANY_NAME}_${PACKAGE_VERSION}.ipa"
cp -i "$IPA_PATH" "./$DEST_IPA" || { echo "Error: Failed to move IPA file"; exit 1; }

echo "IPA file moved: ${PACKAGE_NAME}.ipa -> ${DEST_IPA}"


#Test