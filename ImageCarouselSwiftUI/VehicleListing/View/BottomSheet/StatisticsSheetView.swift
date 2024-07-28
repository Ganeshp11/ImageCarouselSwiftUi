//
//  StatisticsSheetView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 25/07/24.
//

import SwiftUI

struct StatisticsSheetView: View {
    @Binding var modelCounts: [String: Int]
    @Binding var characterCounts: [CharacterCount]
    
    var body: some View {
        VStack{
            StatisticsView(modelCount: modelCounts, characterCounts: characterCounts)
        }
        .cornerRadius(20)
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
    }
}

//struct StatisticsSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//          let sampleModelCounts: [String: Int] = ["Brand A": 100]
//          let sampleCharacterCounts: [CharacterCount] = [
//              CharacterCount(character: "a", count: 30),
//              CharacterCount(character: "b", count: 20),
//              CharacterCount(character: "c", count: 15)
//          ]
//
//          return StatisticsSheetView(modelCounts: sampleModelCounts, characterCounts: sampleCharacterCounts)
//              .previewLayout(.sizeThatFits)
//      }
//}
