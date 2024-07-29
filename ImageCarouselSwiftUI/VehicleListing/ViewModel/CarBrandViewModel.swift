//
//  ImageCarouselSwiftUIApp.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 22/07/24.
//

import Foundation

class CarBrandsViewModel: ObservableObject {
    @Published var brands: [CarBrand] = []
    @Published var selectedBrandIndex: Int = 0
    @Published var searchText: String = ""
    @Published var modelCount: [String: Int] = [:]
    @Published var characterCounts: [CharacterCount] = []
    @Published var errorMessage: String?
    
    private var fileReader: FileReader
    
    init(fileReader: FileReader = FileReader()) {
        self.fileReader = fileReader
        self.loadCarBrands()
//        calculateStatistics()
    }
    private func loadCarBrands() {
        do {
            let response:CarBrandResponse =  try fileReader.decode(fromFile: Strings.fileName, type: Strings.type)
            brands = response.carBrands ?? []
        } catch (let error) {
            handleError(error.localizedDescription)
        }
    }
    
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

    
    func calculateStatistics() {
        var modelCounts: [String: Int] = [:]
        var characterCounts: [Character: Int] = [:]
        
        modelCounts[selectedBrand?.brandName ?? ""] = selectedBrand?.models?.count ?? 0
        
        let allowedCharacters = CharacterSet.letters.union(.decimalDigits)
        
        for car in selectedBrand?.models ?? [] {
            for char in car.modelName?.lowercased() ?? "" {
                if let scalar = char.unicodeScalars.first, allowedCharacters.contains(scalar) {
                    characterCounts[char, default: 0] += 1
                }
            }
        }
        
        let sortedCharacterCounts = characterCounts.sorted { (first, second) -> Bool in
            if first.value == second.value {
                return first.key < second.key
            }
            return first.value > second.value
        }
            .map { CharacterCount(character: $0.key, count: $0.value) }
            .prefix(3)
        
        self.modelCount = modelCounts
        self.characterCounts = Array(sortedCharacterCounts)
    }
    private func handleError(_ error: String) {
        DispatchQueue.main.async {
            self.errorMessage = error
        }
    }
}
