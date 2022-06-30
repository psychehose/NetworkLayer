//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by KIM HOSE on 2022/06/30.
//

import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "Application",
    projects: [
        "Projects/Application",
        "Projects/Features",
        "Projects/Modules",
        "Projects/Network"
    ]
)
