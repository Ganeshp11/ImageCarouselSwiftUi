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
        LazyVStack(alignment: .leading, spacing: 5, pinnedViews: [.sectionHeaders]) {
            Section(header: SearchBarView(searchText: $searchText)) {
                if models.isEmpty {
                    Spacer(minLength: 50)
                    Text("No Match Found")
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundColor(CustomColor.cellColor)
                        .font(.system(size: 22, weight: .bold))
                } else {
                    ForEach(models) { model in
                        CustomCellView(title: model.modelName ?? "", subtitle: model.price ?? "", image: model.imageUrl ?? "")
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .background(Color.clear)
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .padding(.bottom, 10)
        .padding(.top, 5)
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct CarModelsTableView_Previews: PreviewProvider {
    static var previews: some View {
        let carModel = CarModel(id: "1", modelName: "Nexon", imageUrl: "Nexon", price: "11.80")
        CarModelsTableView(searchText: .constant(""), models: [carModel])
        
    }
}
