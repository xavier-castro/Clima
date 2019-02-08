
# README

Notes I wrote for myself on new things that I learned building this app. This app is following Angela Yu's Swift Course on Udemy.

## CoreLocation

- `import CoreLocation`
- ViewController must conform to protocol: `class WeatherViewController: UIViewController, CLLocationManagerDelegate`
- Library that allows you to tap into the GPS and grab data of the iPhone
- The higher the accuracy the more battery it uses, a good range is `kCLLocationAccuracyHundredMeters`

## Editing info.plist to Ask User for Location Permissions

Add the following fields in `info.plist`
- Privacy - Location Usage Description
- Privacy - Location When in Use Usage Description

## Fix for App Transport Security Override (Allow non HTTPS)

This snippet allows you to bypass Apple's HTTPS only rule (Free API from openweatherapp doesn't come with HTTPS)

```
<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSExceptionDomains</key>
		<dict>
			<key>openweathermap.org</key>
			<dict>
				<key>NSIncludesSubdomains</key>
				<true/>
				<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
				<true/>
			</dict>
		</dict>
	</dict>
```

## Delegation
Creating a Delegate is like creating an instance of the ViewController you are trying to pass it to. So ViewController A will have an instance (like a clone model) of ViewController B so when it gets sent to ViewController B it will fit right in

You also have to make sure you have have a protocol delegate relationship or else you are only going to be duplicating views instead of transferring