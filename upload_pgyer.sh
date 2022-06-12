
# pgyer
uKey=xxx
apiKey=xxx
pgyerUrl=https://www.pgyer.com/apiv1/app/upload

# path
projectName=flutter_agora
projectPath=/Users/vincentfeng/Development/flutter/app/${projectName}
androidApkPath=${projectPath}/build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk
iosIpaPath=${projectPath}/build/ios/ipa/${projectName}.ipa

# ex
cd ${projectPath}
androidBuildResult=$(flutter build apk --split-per-abi --no-shrink)
iosBuildResult=$(flutter build ipa --export-method ad-hoc)
uploadResult=$(
curl \
-F "file=@/${androidApkPath}" \
-F "uKey=${uKey}" \
-F "_api_key=${apiKey}" \
${pgyerUrl}
)
uploadResult=$(
curl \
-F "file=@/${iosIpaPath}" \
-F "uKey=${uKey}" \
-F "_api_key=${apiKey}" \
${pgyerUrl}
)