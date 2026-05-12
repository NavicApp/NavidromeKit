# NavidromeKit
Swift library for Navidrome's undocumented API

## Example
```swift
import NavidromeKit

let instanceURL = URL(string: "https://demo.navidrome.org/")!
let authContext = try await APIAuthenticator.createSession(
	instanceURL: instanceURL,
	username: "demo",
	password: "demo"
)

APIClient.shared = APIClient(
	instanceURL: instanceURL,
	authContext: authContext
)

// Serialise the authContext and store it in the keychain, then
// when your app starts, you can restore the context and set the
// client again

// You can store the client instance however you want, but the
// simplest way to do so is to set `APIClient.shared`

let songs = try await APIClient.shared!.fetchSongs()
```

## Notes
* This library is not complete.
	
* Navidrome's API is undocumented and potentially unstable.
  This means it can change at any time and could break this
  library.

* This library is type safe, however, many fields are
  nullable to reflect the API responses nullability.
  
  Basic fields such as the artist ID can be nil, meaning
  your app will have to manually accomodate for them
  being nil. This is unfortunately unavoidable.

* Some parts of this library may not be documented well,
  as it was made primarily for personal projects.

## Licence
MIT
