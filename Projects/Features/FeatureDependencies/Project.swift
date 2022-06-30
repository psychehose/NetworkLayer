//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by KIM HOSE on 2022/06/30.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "FeatureDependencies",
    organizationName: "com.devhose",
    packages: [],
    targets: Project.staticLibrary(
        name: "FeatureDependencies",
        frameworkDependencies: [
            .project(target: "CoreKit", path: .relativeToModule("CoreKit")),
        ],
        testDependencies: []
    ),
    schemes: []
)
