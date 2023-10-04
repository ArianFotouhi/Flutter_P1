# A weather forecast app

## To add premissions for user location:

Add the below:
```
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```
To:
android/app/src/main/AndroidManifest.xml

and also for iOS, add the below:
```
	<key>NSLocationWhenInUseUsageDescription</key>
	<string>This app needs access to location when open.</string>
```
To
'''
ios/Runner/Info.plist
'''
