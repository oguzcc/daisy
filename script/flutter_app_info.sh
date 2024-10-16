#!/bin/bash

# Proje kök dizinini bul
project_root=$(pwd)

# pubspec.yaml dosyasından package name'i al
package_name=$(grep "name:" "$project_root/pubspec.yaml" | sed 's/name: //')

echo "Package Name: $package_name"

# Android bundle ID'sini bul
android_bundle_id=$(grep "applicationId" "$project_root/android/app/build.gradle" | sed "s/.*applicationId \"//" | sed "s/\"//")

echo "Android Bundle ID: $android_bundle_id"

# iOS bundle ID'sini bul
ios_bundle_id=$(grep "PRODUCT_BUNDLE_IDENTIFIER" "$project_root/ios/Runner.xcodeproj/project.pbxproj" | head -1 | sed 's/.*= //' | sed 's/;//')

echo "iOS Bundle ID: $ios_bundle_id"