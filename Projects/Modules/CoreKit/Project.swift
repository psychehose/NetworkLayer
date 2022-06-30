//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by KIM HOSE on 2022/06/30.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "CoreKit",
    organizationName: "com.devhose",
    packages: [],
    targets: Project.dynamicFramework(
        name: "CoreKit",
        frameworkDependencies: [
            .project(target: "ThirdPartyLibraryManager", path: .relativeToModule("ThirdPartyLibraryManager")),
            .project(target: "NetworkKit", path: .relativeToNetwork("Network")),
        ],
        testDependencies: []
    ),
    schemes: []
)
