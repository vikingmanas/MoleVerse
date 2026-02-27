// swift-tools-version: 6.0

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "MoleVerse",
    platforms: [
        .iOS("26.0")
    ],
    products: [
        .iOSApplication(
            name: "MoleVerse",
            targets: ["AppModule"],
            bundleIdentifier: "com.vc.shuaau.MoleVerse2-0-man",
            teamIdentifier: "L5373CS29V",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.red),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            appCategory: .education
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ],
    swiftLanguageVersions: [.version("6")]
)
