#!/usr/bin/env sh

# projeyi refresh eder

# chmod +r run.sh
# ./run.sh for run
rm ./ios/podfile.lock
fvm flutter clean
fvm flutter pub get
#flutter pub upgrade
cd ./ios/
pod cache clean --all
pod deintegrate
sudo gem install cocoapods-deintegrate cocoapods-clean
sudo arch -x86_64 gem install ffi
pod repo add MTXAnalyst https://kamil.ozturk%40optimusyazilim.com.tr:OptMat12935x!@gitlab.matriksdata.com/ios/mtx-pods.git --allow-root
arch -x86_64 pod install
cd ..