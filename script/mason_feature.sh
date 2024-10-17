#!/bin/bash
cd bricks
mason make feature -o ../lib/feature
cd ..
# flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs