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

echo "> Install Certificate"
#security create-keychain -p 0.usiz1ez3f9dbt8c9m0bdcmcxr /Users/vsts/agent/2.154.1/work/_temp/ios_signing_temp.keychain
#security set-keychain-settings -lut 7200 /Users/vsts/agent/2.154.1/work/_temp/ios_signing_temp.keychain
#security unlock-keychain -p 0.usiz1ez3f9dbt8c9m0bdcmcxr /Users/vsts/agent/2.154.1/work/_temp/ios_signing_temp.keychain
#security import development_cert.p12 -P admin123 -A -t cert -f pkcs12 -k /Users/vsts/agent/2.154.1/work/_temp/ios_signing_temp.keychain
security import development_cert.p12 -P admin123

echo "> Install Provisioning Profile"
/usr/bin/security cms -D -i $APPCENTER_SOURCE_DIRECTORY"/wildcard_development_profile.mobileprovision" > tmp.plist
uuid=`/usr/libexec/PlistBuddy -c 'Print:UUID' tmp.plist`
ls /Users/vsts/Library/MobileDevice/Provisioning\ Profiles/
echo "$uuid"
echo "${APPCENTER_SOURCE_DIRECTORY}/wildcard_development_profile.mobileprovision"
echo "~/Library/MobileDevice/Provisioning Profiles/$uuid.mobileprovision"
echo "test"
pwd
mv wildcard_development_profile.mobileprovision ${uuid}.mobileprovision
cp ${uuid}.mobileprovision /Users/vsts/Library/MobileDevice/Provisioning\ Profiles/
rm -rf tmp.plist
echo "check profiles"
ls /Users/vsts/Library/MobileDevice/Provisioning\ Profiles/
echo "**************************************************************************************************"
echo "Post Clone Script complete"
echo "**************************************************************************************************"