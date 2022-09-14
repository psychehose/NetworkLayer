//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by KIM HOSE on 2022/06/30.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "NetworkLayer",
    organizationName: "com.devhose",
    packages: [],
    targets: Project.appTargets(
        name: "NetworkLayer",
        appDependencies: [
            .project(
                target: "Features",
                path: .relativeToFeature("")
            )
        ],
        testDependencies: []
    ),
    schemes: [],
    additionalFiles: []
)
