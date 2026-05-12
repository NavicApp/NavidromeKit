// swift-tools-version: 6.2
import PackageDescription

let package = Package(
	name: "NavidromeKit",
	platforms: [
		.iOS(.v14),
		.macOS(.v12)
	],
	products: [
		.library(name: "NavidromeKit", targets: ["NavidromeKit"])
	],
	targets: [
		.target(name: "NavidromeKit")
	]
)
