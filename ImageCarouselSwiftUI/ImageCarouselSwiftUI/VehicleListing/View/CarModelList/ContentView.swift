//
//  ContentView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 22/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CarBrandsViewModel()
    
    var body: some View {
            VStack(spacing: 20) {
                if !viewModel.brands.isEmpty {
                    ScrollView {
                        BrandImageView(selectedIndex: $viewModel.selectedBrandIndex, brands: viewModel.brands)
                            .onChange(of: viewModel.selectedBrandIndex) {
                                viewModel.searchText = ""
                            }
                        CarModelsTableView(searchText: $viewModel.searchText, models: viewModel.filteredCarModels)
                    }
                } else {
                    Text("No brands found")
                                .frame(minHeight: 100)
                }
            }
            .padding(.leading, 5)
            .padding(.trailing, 5)
            .background(Image("BackGround"))
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
