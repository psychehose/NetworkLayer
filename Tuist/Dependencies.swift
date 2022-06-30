//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by KIM HOSE on 2022/06/30.
//

import ProjectDescription

let dependencies = Dependencies(
    carthage: [
        .github(path: "Alamofire/Alamofire", requirement: .branch("master")),
//        .github(path: "layoutBox/FlexLayout", requirement: .branch("master")),
//        .github(path: "layoutBox/PinLayout", requirement: .branch("master")),
//        .github(path: "SnapKit/SnapKit", requirement: .exact("5.0.0")),
        .github(path: "ReactiveX/RxSwift", requirement: .exact("6.5.0")),
//        .github(path: "uber/RIBs", requirement: .branch("main")),
    ],
    swiftPackageManager: [
    ],
    platforms: [.iOS]
)
