//
//  StatisticsView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 29/07/24.
//

import SwiftUI

struct StatisticsView: View {
    var modelCount: [String: Int]
    var characterCounts: [CharacterCount]
    
    var body: some View {
        VStack {
            HStack() {
                Spacer()
                VStack {
//                    Spacer()
                    VStack {
                        ForEach(modelCount.sorted(by: >), id: \.key) { key, value in
                            Text("\(key): \(value) Models")
                                .font(.headline)
                                .foregroundColor(CustomColor.fontColor)
                                .font(.system(size: 20, weight: .semibold))
                                .padding(.vertical, 10)
                        }
                        ForEach(characterCounts) { characterCount in
                            HStack {
                                Spacer()
                                Text("\(String(characterCount.character ?? " ")):")
                                    .foregroundColor(CustomColor.fontColor)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding(.vertical, 10)
                                Text("\(characterCount.count ?? 0)")
                                    .foregroundColor(CustomColor.fontColor)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding(.vertical, 10)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical, 20)
                    .background(CustomColor.cellColor)
                    .border((CustomColor.borderColor), width: 0.5)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke((CustomColor.borderColor), lineWidth: 0.5)
                    )
                    Spacer()
                }
                .padding(.top, 40)
                .padding(.horizontal, 20)
                Spacer()
            }
        }
        .padding(.top, 20)
        .background(CustomColor.background)
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCharacterCounts = [
            CharacterCount(character: "a", count: 5),
            CharacterCount(character: "r", count: 6),
            CharacterCount(character: "i", count: 3)
        ]
        
        StatisticsView(modelCount: ["Tata": 7], characterCounts: sampleCharacterCounts)
    }
}
