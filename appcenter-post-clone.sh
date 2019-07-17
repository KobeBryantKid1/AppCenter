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
echo "$uuid"
echo "${APPCENTER_SOURCE_DIRECTORY}/wildcard_dev_profile.mobileprovision"
echo "~/Library/MobileDevice/Provisioning Profiles/$uuid.mobileprovision"
for file in `ls ~/Library/MobileDevice/Provisioning Profiles/`
do
    echo $file
done
echo "test"
cp "${APPCENTER_SOURCE_DIRECTORY}/wildcard_dev_profile.mobileprovision" "~/Library/MobileDevice/Provisioning Profiles/$uuid.mobileprovision"
rm -rf tmp.plist
echo "check profiles"
for file in `ls ls ~/Library/MobileDevice/Provisioning Profiles/`
do
    echo $file
done
echo "**************************************************************************************************"
echo "Post Clone Script complete"
echo "**************************************************************************************************"