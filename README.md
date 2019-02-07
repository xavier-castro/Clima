
# Notes

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
