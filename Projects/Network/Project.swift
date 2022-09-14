//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by KIM HOSE on 2022/06/30.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "NetworkKit",
    organizationName: "com.devhose",
    packages: [
    ],
    targets: Project.staticLibrary(
        name: "NetworkKit",
        frameworkDependencies: [
            .project(target: "ThirdPartyLibraryManager", path: .relativeToModule("ThirdPartyLibraryManager"))
        ],
        testDependencies: []
    ),
    schemes: []
)
