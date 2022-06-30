//
//  Project+Framework.swift
//  ProjectDescriptionHelpers
//
//  Created by KIM HOSE on 2022/06/30.
//

import ProjectDescription

extension Project {
    public static func staticFrameworkTargets(
        name: String,
        frameworkDependencies: [TargetDependency],
        testDependencies: [TargetDependency]
    ) -> [Target] {

        // MARK: - staticframework에는 resource 필요없음.
        let frameworkTarget = Target(
            name: name,
            platform: .iOS,
            product: .staticFramework,
            bundleId: "com.devhose.\(name)",
            deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
            infoPlist: .default,
            sources: ["Sources/**/*.swift"],
            dependencies: frameworkDependencies
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

        return [frameworkTarget, testTarget]
    }

    public static func staticLibrary(
        name: String,
        frameworkDependencies: [TargetDependency],
        testDependencies: [TargetDependency],
        useDemoApp: Bool = false
    ) -> [Target] {

        let library = Target(
            name: name,
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "com.devhose.\(name)",
            deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
            infoPlist: .default,
            sources: ["Sources/**/*.swift"],
            dependencies: frameworkDependencies
        )
        let testTarget = Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.devhose.\(name)Tests",
            deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: name)] + testDependencies
        )

        let demoAppTargets: [Target] = [

            Target(
                name: "\(name)UI",
                platform: .iOS,
                product: .staticLibrary,
                bundleId: "com.devhose.feature.\(name).ui",
                deploymentTarget: .iOS(targetVersion: "14.0", devices: [.iphone]),
                sources: ["Sources/**"],
                settings: .settings(base: ["OTHER_LDFLAGS": "$(inherited) -all_load"])
            ),
            Target(
                name: "\(name)PreviewApp",
                platform: .iOS,
                product: .app,
                bundleId: "com.devhose.feature.\(name).uipreviewApp",
                deploymentTarget: .iOS(targetVersion: "14.0", devices: [.iphone]),
                sources: ["Application/UIPreviewApp/Sources/**"],
                resources: ["Application/UIPreviewApp/Resources/**"],
                dependencies: [
                    .target(name: "\(name)UI"),
                    .package(product: "Inject"),
                ],
                settings: .settings(base: ["OTHER_LDFLAGS": "$(inherited) -Xlinker -interposable -all_load"])
            ),
            Target(
                name: "\(name)DemoApp",
                platform: .iOS,
                product: .app,
                bundleId: "com.devhose.feature.\(name).demoApp",
                deploymentTarget: .iOS(targetVersion: "14.0", devices: [.iphone]),
                sources: ["Application/DemoApp/Sources/**"],
                resources: ["Application/DemoApp/Resources/**"],
                dependencies: [
                    .target(name: "\(name)"),
                    .package(product: "Inject"),
                ],
                settings: .settings(base: ["OTHER_LDFLAGS": "$(inherited) -Xlinker -interposable -all_load"])
            )
        ]


        if useDemoApp {
            return [library, testTarget] + demoAppTargets
        } else {
            return [library, testTarget]
        }

    }

    public static func dynamicFramework(
        name: String,
        frameworkDependencies: [TargetDependency],
        resources: ResourceFileElements = [],
        testDependencies: [TargetDependency]
    ) -> [Target] {

        let framework = Target(
            name: name,
            platform: .iOS,
            product: .framework,
            bundleId: "com.devhose.\(name)",
            deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
            infoPlist: .default,
            sources: ["Sources/**/*.swift"],
            resources: resources,
            dependencies: frameworkDependencies,
            settings: .settings(base:[
                "OTHER_LDFLAGS" : "$(inherited) -all_load"
            ])
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.devhose.\(name)Tests",
            deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: name)] + testDependencies
        )
        return [framework, testTarget]
    }
}
