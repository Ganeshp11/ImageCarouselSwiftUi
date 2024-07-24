//
//  BrandListView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 22/07/24.
//

import SwiftUI

struct BrandListView: View {
    @Binding var selectedIndex: Int
    let brands: [CarBrand]
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(brands.indices, id: \.self) { index in
                Image(brands[index].imageUrl ?? "")
                    .resizable()
                    .scaledToFit()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 200)
    }
}

