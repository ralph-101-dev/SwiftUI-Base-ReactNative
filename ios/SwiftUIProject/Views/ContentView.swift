//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by ralph-L on 2023/06/16.
//

import SwiftUI

struct ContentView: View {
    @State var props: [AnyHashable: Any]? = [:]
    
    var body: some View {
        VStack {
            ReactNativeView(moduleName: "App", props: $props)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
