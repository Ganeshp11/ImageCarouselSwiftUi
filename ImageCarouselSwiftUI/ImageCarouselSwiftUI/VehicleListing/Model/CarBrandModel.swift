//
//  ImageCarouselSwiftUIApp.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 22/07/24.
//

import Foundation

struct CarBrandResponse: Codable {
    let carBrands: [CarBrand]?
}

struct CarBrand: Identifiable, Codable {
    let id: String?
    let brandName: String?
    let manufacturer: String?
    let models: [CarModel]?
    let imageUrl: String?
}

struct CarModel: Identifiable, Codable {
    let id: String?
    let modelName: String?
    let imageUrl: String?
    let price: String?
}
