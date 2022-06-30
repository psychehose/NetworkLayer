//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by KIM HOSE on 2022/06/30.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "ThirdPartyLibraryManager",
    organizationName: "com.devhose",
    packages: [],
    targets: Project.dynamicFramework(
        name: "ThirdPartyLibraryManager",
        frameworkDependencies: [
            .external(name: "Alamofire"),
            .external(name: "RxSwift"),
            .external(name: "RxCocoa"),
            .external(name: "RxRelay")
        ],
        testDependencies: []
    ),
    schemes: []
)
