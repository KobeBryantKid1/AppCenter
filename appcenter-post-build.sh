#!/usr/bin/env bash

# Post Build Script

set -e # Exit immediately if a command exits with a non-zero status (failure)

echo "**************************************************************************************************"
echo "Post Build Script"
echo "**************************************************************************************************"

##################################################
# Start UI Tests
##################################################

# variables
appCenterLoginApiToken=$AppCenterLoginForAutomatedUITests # this comes from the build environment variables
appName="1018429013-qq.com/AppCenter"
deviceSetName="1018429013-qq.com/iphone-xs-max"
testSeriesName="functional-tests"

echo ""
echo "Start XCUITest run"
echo "   App Name: $appName"
echo " Device Set: $deviceSetName"
echo "Test Series: $testSeriesName"

echo "> Build for test"
rm -rf DerivedData
xcrun xcodebuild build-for-testing -configuration Release -workspace sampleapp-ios-swift.xcworkspace -sdk iphoneos -scheme sampleapp-ios-swift -derivedDataPath DerivedData

echo "> Run UI test command"
# Note: must put a space after each parameter/value pair
appcenter test run xcuitest --app $appName --devices $deviceSetName --app-path $APPCENTER_OUTPUT_DIRECTORY/sampleapp-ios-swift.ipa --test-series $testSeriesName --locale "en_US" --build-dir $APPCENTER_SOURCE_DIRECTORY/DerivedData/Build/Products/Release-iphoneos --token $appCenterLoginApiToken 

echo ""
echo "**************************************************************************************************"
echo "Post Build Script complete"
echo "**************************************************************************************************"


echo "**************************************************************************************************"
echo "Post Build Script complete"
echo "**************************************************************************************************"
