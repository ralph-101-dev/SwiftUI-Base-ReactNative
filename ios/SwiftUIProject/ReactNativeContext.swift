//
//  ReactNativeContext.swift
//  SwiftUIProject
//
//  Created by ralph-L on 2023/06/16.
//

import Foundation

import React

final class ReactNativeContext: NSObject {
    static let shared = ReactNativeContext()
    
    private(set) var bridge: RCTBridge!
    
    private override init() {
        super.init()
        
        self.bridge = RCTBridge(delegate: self)
    }
}

extension ReactNativeContext: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
#if DEBUG
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(
            forBundleRoot: "index",
            fallbackURLProvider: nil
        )!
#else
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(
            forBundleRoot: "index",
            fallbackExtension: "jsbundle"
        )!
#endif
    }
}
