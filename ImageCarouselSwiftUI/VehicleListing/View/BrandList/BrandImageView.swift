//
//  BrandImageView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 22/07/24.
//

import SwiftUI

struct BrandImageView: View {
    @Binding var selectedIndex: Int
    let brands: [CarBrand]
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(brands.indices, id: \.self) { index in
                Image(brands[index].imageUrl ?? "")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 10)
                    .padding(.bottom, 30)
                    .tag(index)
                    .frame(width: SizeConstants.brandImageWeight, height: SizeConstants.brandImageWeight)
                        .aspectRatio(contentMode: .fit)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: SizeConstants.brandFramHeight)
    }
}

