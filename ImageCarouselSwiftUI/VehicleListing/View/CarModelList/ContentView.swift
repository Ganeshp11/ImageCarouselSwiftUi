//
//  ContentView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 22/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showStatistics = false
    @StateObject private var viewModel = CarBrandsViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                        if !viewModel.brands.isEmpty {
                            BrandImageView(selectedIndex: $viewModel.selectedBrandIndex, brands: viewModel.brands)
                                .onChange(of: viewModel.selectedBrandIndex) {
                                    viewModel.searchText = ""
                                }
                            CarModelsTableView(searchText: $viewModel.searchText, models: viewModel.filteredCarModels)
                        } else {
                            Text(Strings.noBrand)
                                .frame(minHeight: 100)
                        }
                    }
                    .padding(2)
                }
                .safeAreaPadding(EdgeInsets(.zero))
                ButtonView(showStatistics: $showStatistics, startCalculateStatistics: {
                    viewModel.calculateStatistics()
                })
                    .sheet(isPresented: $showStatistics) {
                        StatisticsSheetView(modelCounts: $viewModel.modelCount, characterCounts: $viewModel.characterCounts)
                            .background(Color(CustomColor.background))
                    }
            }
            .background(Image("BackGround"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(viewModel.brands[viewModel.selectedBrandIndex].brandName?.uppercased() ?? "")
                        .bold()
                        .font(.title)
                        .foregroundColor(CustomColor.cellColor)
                        .tint(CustomColor.cellColor)
                    
                }
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
