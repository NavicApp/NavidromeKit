# NavidromeKit

> [!WARNING]
> This package, and the API that it uses, is unstable and
> not finalised. This library was also made only for use
> with Navic, so do not expect stability, good docs, or
> any support with using it.
>
> **This project is also not under a permissive licence,**
> basically meaning you can't legally use it in all
> situations. See the licence section below.

[![Swift Version](https://img.shields.io/badge/Swift-6.2-blue)](/Package.swift)
![Platforms](https://img.shields.io/badge/Platforms-iOS_|_macOS_|_Linux-blue)
[![Licence](https://img.shields.io/badge/Licence-GPL--3.0--only-blue)](/LICENCE)
[![Tests Status](https://img.shields.io/github/actions/workflow/status/NavicApp/NavidromeKit/tests.yml?branch=master&label=Tests)](https://github.com/NavicApp/NavidromeKit/actions/workflows/tests.yml)

Swift package for Navidrome's API

## Installation

Add this package to your Package.swift, or Xcode project:

```swift
let package = Package(
	name: "Example",
	dependencies: [
		.package(url: "https://github.com/NavicApp/NavidromeKit", branch: "master")
	],
	targets: [
		.target(name: "Example", dependencies: ["NavidromeKit"])
	]
)
```

Some usage examples can be seen in the
[unit tests](/Tests/NavidromeKitTests/AuthenticatedTests.swift).

## Licence

In the spirit of keeping things free and open source,
this library is under the [GPLv3 licence](https://choosealicense.com/licenses/gpl-3.0/).

Commercial or permissive licensing is available upon
request. Navidrome itself is FOSS, so I think it makes
sense to be FOSS and encourage being FOSS as well :)
