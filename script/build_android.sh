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
echo "COMPANY: ${COMPANY_NAME}"
echo "BRANCH_LIST: ${BRANCH_LIST}"

# Flutter path
export PATH="/Users/Shared/flutter/bin:$PATH"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if ! which flutter > /dev/null 2>&1; then
  echo "Error: Flutter is not installed or not in PATH"
  exit 1
fi

# Check Flutter version
flutter --version

# GitLab repository access
echo "Step 1: Cleaning"
#flutter clean

echo "Step 2: Getting packages"
#flutter pub get

echo "Step 3: Building"
# Build the APK file
if ! flutter build apk --release; then
  echo "Error: Flutter build failed"
  exit 1
fi

# Check if APK file was generated
APK_PATH="build/app/outputs/flutter-apk/app-release.apk"

if [ ! -f "$APK_PATH" ]; then
  echo "Error: APK file not found at $APK_PATH"
  exit 1
fi

# Move and rename the APK file
DEST_APK="${DATENOWTIMESTAMP}_${COMPANY_NAME}_${PACKAGE_VERSION}.apk"
cp -i "$APK_PATH" "./$DEST_APK" || { echo "Error: Failed to move APK file"; exit 1; }

echo "APK file copied: app-release.apk -> ${DEST_APK}"

