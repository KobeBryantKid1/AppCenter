set -e # Exit immediately if a command exits with a non-zero status (failure)

echo "**************************************************************************************************"
echo "Post Clone Script"
echo "**************************************************************************************************"

function read_dir(){
for file in `ls $1`
do
    if [ -d $1"/"$file ]
    then
        read_dir $1"/"$file
    else
        echo $1"/"$file
    fi
done
}

/usr/bin/security cms -D -i $APPCENTER_SOURCE_DIRECTORY"/wildcard_dev_profile.mobileprovision" > tmp.plist
uuid=`/usr/libexec/PlistBuddy -c 'Print:UUID' tmp.plist`
ls /Users/vsts/Library/MobileDevice/Provisioning\ Profiles/
echo "$uuid"
echo "${APPCENTER_SOURCE_DIRECTORY}/wildcard_dev_profile.mobileprovision"
echo "~/Library/MobileDevice/Provisioning Profiles/$uuid.mobileprovision"
echo "test"
mv ${APPCENTER_SOURCE_DIRECTORY}/wildcard_dev_profile.mobileprovision ${APPCENTER_SOURCE_DIRECTORY}/${uuid}.mobileprovision
cp "${APPCENTER_SOURCE_DIRECTORY}/${uuid}.mobileprovision" "/Users/vsts/Library/MobileDevice/Provisioning\ Profiles/"
rm -rf tmp.plist
echo "check profiles"
ls /Users/vsts/Library/MobileDevice/Provisioning\ Profiles/
echo "**************************************************************************************************"
echo "Post Clone Script complete"
echo "**************************************************************************************************"