//
//  ReactView.swift
//  SwiftUIProject
//
//  Created by ralph-L on 2023/06/16.
//

import SwiftUI

import React

struct ReactNativeView: UIViewRepresentable {
    let moduleName: String
    @Binding var props: [AnyHashable: Any]?
    
    func makeUIView(context: Context) -> some UIView {
        let rctRootView = RCTRootView(
            bridge: ReactNativeContext.shared.bridge,
            moduleName: moduleName,
            initialProperties: props
        )
        
        return rctRootView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let rctRootView = uiView as? RCTRootView,
              let props else { return }
        
        rctRootView.appProperties = props
    }
}
