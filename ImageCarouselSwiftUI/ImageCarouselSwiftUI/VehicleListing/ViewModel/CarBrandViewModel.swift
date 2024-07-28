//
//  ImageCarouselSwiftUIApp.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 22/07/24.
//

import Foundation
//
//class CarBrandViewModel {
//    var carBrands: [CarBrand] = []
//    var filteredCarModels: [CarModel] = []
//    var selectedCarBrand: CarBrand?
//    var searchText: String = "" {
//        didSet {
//            filterModels()
//        }
//    }
//    
//    init() {
//        loadCarBrands()
//        filterModels()
//    }
//    
//    private func loadCarBrands() {
//        if let carBrandResponse: CarBrandResponse = FileReader.decode(fromFile: "CarBrands", type: CarBrandResponse.self) {
//            carBrands = carBrandResponse.carBrands ?? []
//            selectedCarBrand = carBrands.first
//            filteredCarModels = selectedCarBrand?.models ?? []
//        }
//    }
//    func filterModels() {
//      if let selectedCarBrand = selectedCarBrand, let models = selectedCarBrand.models {
//        if searchText.isEmpty {
//          filteredCarModels = models
//        } else {
//          filteredCarModels = models.filter { model in
//            model.modelName?.lowercased().contains(searchText.lowercased()) ?? false
//          }
//        }
//      } else {
//        filteredCarModels = []
//      }
//    }
// 
//    func getCarBrand(at index: Int) -> CarBrand? {
//        guard index >= 0 && index < carBrands.count else {
//            return nil
//        }
//        return carBrands[index]
//    }
//    
//    func selectCarBrand(at index: Int) {
//        selectedCarBrand = getCarBrand(at: index)
//        filterModels()
//    }
//}

//class CarBrandsViewModel: ObservableObject {
//    @Published var carBrands: [CarBrand] = []
//    @Published var selectedBrandIndex: Int = 0
//
//    @Published var searchText: String = ""
//    @Published var selectedBrand: CarBrand? = nil
//
//    var filteredCarModels: [CarModel] {
//        if let selectedBrand = selectedBrand, let models = selectedBrand.models {
//            if searchText.isEmpty {
//                return selectedBrand.models ?? []
//            } else {
//                
//                return models.filter { model in
//                    model.modelName?.lowercased().contains(searchText.lowercased()) ?? false
//                    
//                }
//            }       
//        } else {
//            return []
//        }
//       
//    }
//
//    init() {
//        loadCarBrands()
//    }
//
//    private func loadCarBrand() {
//        if let url = Bundle.main.url(forResource: "carBrands", withExtension: "json"),
//           let data = try? Data(contentsOf: url),
//           let carBrands = try? JSONDecoder().decode([CarBrand].self, from: data) {
//            self.selectedBrand = carBrands.first
//        }
//    }
//    private func loadCarBrands() {
//        if let carBrandResponse: CarBrandResponse = FileReader.decode(fromFile: "CarBrands", type: CarBrandResponse.self) {
//            carBrands = carBrandResponse.carBrands ?? []
//            self.selectedBrand = carBrands.first
//
////            filteredCarModels = selectedCarBrand?.models ?? []
//        }
//    }
//}

class CarBrandsViewModel: ObservableObject {
    @Published var brands: [CarBrand] = []
    @Published var selectedBrandIndex: Int = 0
    @Published var searchText: String = ""
    
    var selectedBrand: CarBrand? {
        return brands.isEmpty ? nil : brands[selectedBrandIndex]
    }
    
    var filteredCarModels: [CarModel] {
        if let selectedBrand = selectedBrand, let models = selectedBrand.models {
            if searchText.isEmpty {
                return selectedBrand.models ?? []
            } else {
                
                return models.filter { model in
                    model.modelName?.lowercased().contains(searchText.lowercased()) ?? false
                    
                }
            }
        } else {
            return []
        }
       
    }
    
    init() {
        self.loadCarBrands()
    }
    
    private func loadCarBrands() {
        if let carBrandResponse: CarBrandResponse = FileReader.decode(fromFile: "CarBrands", type: CarBrandResponse.self) {
            brands = carBrandResponse.carBrands ?? []
        }
    }

}
