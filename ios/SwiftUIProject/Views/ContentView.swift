//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by ralph-L on 2023/06/16.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            List {
                Section("Screens") {
                    ForEach(ScreenMap.allCases, id: \.path) { screen in
                        Button(screen.rawValue) {
                            router.push(path: screen.mockPath)
                        }
                    }
                }
            }
            .navigationTitle("Navigator")
            .navigationDestination(for: Destination.self) { destination in
                DynamicScreen(destination: destination)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Router.shared)
    }
}
