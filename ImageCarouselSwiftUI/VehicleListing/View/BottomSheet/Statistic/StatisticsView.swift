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
                    VStack {
                        ForEach(modelCount.sorted(by: >), id: \.key) { key, value in
                            Text("\(key): \(value) " + Strings.models)
                                .foregroundColor(CustomColor.fontColor)
                                .font(FontSizeClass.extraLarge)
                                .padding(.vertical, 10)
                        }
                        ForEach(characterCounts) { characterCount in
                            HStack {
                                Spacer()
                                Text("\(String(characterCount.character ?? " ")):")
                                    .foregroundColor(CustomColor.fontColor)
                                    .font(FontSizeClass.large)
                                    .padding(.vertical, 10)
                                Text("\(characterCount.count ?? 0)")
                                    .foregroundColor(CustomColor.fontColor)
                                    .font(FontSizeClass.large)
                                    .padding(.vertical, 10)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical, 20)
                    .background(CustomColor.cellColor)
                    .border((CustomColor.borderColor), width: SizeConstants.borderWidth)
                    .cornerRadius(SizeConstants.radius)
                    .overlay(
                        RoundedRectangle(cornerRadius: SizeConstants.radius)
                            .inset(by: 0.5)
                            .stroke((CustomColor.borderColor), lineWidth: SizeConstants.borderWidth)
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
