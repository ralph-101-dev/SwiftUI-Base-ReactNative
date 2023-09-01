//
//  ReactNativeRouterModule.swift
//  SwiftUIProject
//
//  Created by ralph-L on 2023/09/01.
//

import Foundation

@objc(ReactNativeRouterModule)
final class ReactNativeRouterModule: NSObject {
    @objc(push:)
    func push(_ path: String) {
        DispatchQueue.main.async {
            Router.shared.push(path: path)
        }
    }

    @objc
    func goBack() {
        DispatchQueue.main.async {
            Router.shared.goBack()
        }
    }
    
    @objc
    func popToRoot() {
        DispatchQueue.main.async {
            Router.shared.popToRoot()
        }
    }

    @objc
    static func requiresMainQueueSetup() -> Bool {
        false
    }
}
