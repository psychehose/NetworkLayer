//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by KIM HOSE on 2022/06/30.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "YourFeatureName",
    organizationName: "com.jstock",
    packages: [.remote(url: "https://github.com/krzysztofzablocki/Inject.git", requirement: .revision("0844cfbd6af3d30314adb49c8edf22168d254467"))],
    targets: Project.staticLibrary(
        name: "YourFeatureName",
        frameworkDependencies: [
            .project(target: "FeatureDependencies", path: .relativeToFeature("FeatureDependencies"))
        ],
        testDependencies: [],
        useDemoApp: true
    ),
    schemes: []
)

