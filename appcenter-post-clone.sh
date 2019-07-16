set -e # Exit immediately if a command exits with a non-zero status (failure)

echo "**************************************************************************************************"
echo "Post Clone Script"
echo "**************************************************************************************************"

/usr/bin/security cms -D -i $APPCENTER_SOURCE_DIRECTORY"/wildcard_dev_profile.mobileprovision" > tmp.plist
uuid=`/usr/libexec/PlistBuddy -c 'Print:UUID' tmp.plist`
echo "$uuid"