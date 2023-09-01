//
//  ProductDetailView.swift
//  SwiftUIProject
//
//  Created by ralph-L on 2023/09/01.
//

import SwiftUI

struct ProductDetailView: View {
    let productId: String
    
    var body: some View {
        Text("ProductDetailView \(productId)")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productId: "123")
    }
}
