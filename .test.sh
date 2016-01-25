#! /bin/bash

TEST_CMD="xcodebuild -scheme contakt -project contakt/contakt.xcodeproj -sdk iphonesimulator9.2 -destination 'platform=iOS Simulator,name=iPhone 6s Plus,OS=9.2' build test"

which -s xcpretty
XCPRETTY_INSTALLED=$?

if [[ $TRAVIS || $XCPRETTY_INSTALLED == 0 ]]; then
  eval "${TEST_CMD} | xcpretty"
else
  eval "$TEST_CMD"
fi