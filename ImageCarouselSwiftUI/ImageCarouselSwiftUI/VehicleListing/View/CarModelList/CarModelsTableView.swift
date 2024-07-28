//
//  CarModelsTableView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 23/07/24.
//

import SwiftUI

struct CarModelsTableView: View {
    @Binding var searchText: String
    let models: [CarModel]
    
    var body: some View {
        List {
            Section(header: SearchBarView(searchText: $searchText)) {
                ForEach(models) { model in
                    CustomCellView(title: model.modelName ?? "", subtitle: model.price ?? "", image: model.imageUrl ?? "")
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                        .background(Color.clear)
                }
            }
        }
        .padding(.top, 2)
        .listStyle(PlainListStyle())
        .onAppear {
                   UITableView.appearance().separatorStyle = .none
        }
        .background(Color(.clear))
    }
}

struct CarModelsTableView_Previews: PreviewProvider {
    static var previews: some View {
        CarModelsTableView(searchText: .constant(""), models: [
            CarModel(id: "1", modelName: "Nexon", imageUrl: "Nexon", price: "11.80")
        ])
    }
}
