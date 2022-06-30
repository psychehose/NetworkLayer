//
//  Project+App.swift
//  ProjectDescriptionHelpers
//
//  Created by KIM HOSE on 2022/06/30.
//

import ProjectDescription

extension Project {
    public static func appTargets(
        name: String,
        appDependencies: [TargetDependency],
        testDependencies: [TargetDependency]

    ) -> [Target] {
        let plist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen",
            "NSAppTransportSecurity": .dictionary([
                "NSAllowsArbitraryLoads": .boolean(true)
            ])
        ]

        let mainTarget = Target(
            name: name,
            platform: .iOS,
            product: .app,
            productName: name,
            bundleId: "com.devhose.\(name)",
            deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
            infoPlist: .extendingDefault(with: plist),
            sources: ["Sources/**/*.swift"],
            resources: ["Resources/**"],
            dependencies: appDependencies,
            settings: .settings(
                configurations: [
                    .debug(
                        name: "Development",
                        settings: [:],
                        xcconfig: .init("Configuration/\(name)-Development.xcconfig")
                    ),
                    .debug(
                        name: "Staging",
                        settings: [:], xcconfig: .init("Configuration/\(name)-Staging.xcconfig")
                    ),
                    .release(
                        name: "Release",
                        settings: [:],
                        xcconfig: .init("Configuration/\(name)-Production.xcconfig")
                    )
                ]
            )
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.devhose.\(name)Tests",
            deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.target(name: name)] + testDependencies
        )

        return [mainTarget, testTarget]

    }
}

public extension ProjectDescription.Path {
    static func relativeToModule(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/Modules/\(pathString)")
    }
    static func relativeToFeature(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/Features/\(pathString)")
    }
    static func relativeToUserInterface(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/UserInterface/\(pathString)")
    }
    static func relativeToNetwork(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/Network/\(pathString)")
    }
    static func relativeToDesignSystem(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/UserInterface/DesignSystem/\(pathString)")
    }
    static func relativeToCoreKit(_ pathString: String) -> Self {
        return .relativeToRoot("Projects/CoreKit/\(pathString)")
    }
}
