//
//  Router.swift
//  SwiftUIProject
//
//  Created by ralph-L on 2023/09/01.
//

import SwiftUI
import URLNavigator

final class Router: ObservableObject {
    static let shared = Router()
    @Published var navigationPath = NavigationPath()
    private(set) var navigator: NavigatorProtocol = Navigator()

    private init() {
        registerScreens()
    }
    
    func push(path: String, animated: Bool = true) {
        navigator.open("\(Env.baseURL)\(path)")
    }

    func goBack(animated: Bool = true) {
        navigationPath.removeLast()
    }
    
    func popToRoot(animated: Bool = true) {
        navigationPath = NavigationPath()
    }
    
    private func registerScreens() {
        for screen in ScreenMap.allCases {
            navigator.handle(screen.path) { [weak self] url, values, context in
                let params = values.merging(url.queryParameters as [String: Any]) { _, new in new }
                
                self?.navigationPath.append(Destination(url: url.urlStringValue, screen: screen, params: params, context: nil))
                
                return true
            }
        }
    }
}

struct Destination: Hashable {
    static func == (lhs: Destination, rhs: Destination) -> Bool {
        lhs.url == rhs.url
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
    }

    let url: String
    let screen: ScreenMap
    let params: [AnyHashable: Any]?
    let context: Any?
}

enum ScreenMap: String, CaseIterable {
    case home = "Home"
    case product = "Product"
    case promotion = "promotion"
    
    var path: String {
        switch self {
        case .home:
            return "/browse"
        case .product:
            return "/products/<productId>"
        case .promotion:
            return "/promotion/<promotionId>"
        }
    }
    
    var mockPath: String {
        switch self {
        case .home:
            return "/browse"
        case .product:
            return "/products/123"
        case .promotion:
            return "/promotion/999"
        }
    }
}

struct DynamicScreen: View {
    let destination: Destination
    
    var body: some View {
        switch destination.screen {
        case .home:
            HomeView()
        case .product:
            if let productId = destination.params?["productId"] as? String {
                ProductDetailView(productId: productId)
            }
        case .promotion:
            ReactNativeView(moduleName: "PromotionScreen", props: destination.params)
        }
    }
}
