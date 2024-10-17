#!/bin/bash
cd bricks
mason make data -o ../lib/data
cd ..
# flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs