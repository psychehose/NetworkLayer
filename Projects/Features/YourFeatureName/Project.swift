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
    organizationName: "com.devHose",
    packages: [],
    targets: Project.staticLibrary(
        name: "YourFeatureName",
        frameworkDependencies: [
            .project(target: "FeatureDependencies", path: .relativeToFeature("FeatureDependencies"))
        ],
        testDependencies: [],
        useDemoApp: false
    ),
    schemes: []
)

