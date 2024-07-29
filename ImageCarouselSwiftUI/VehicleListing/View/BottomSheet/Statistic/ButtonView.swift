//
//  ButtonView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 29/07/24.
//

import SwiftUI

struct ButtonView: View {
    @Binding var showStatistics: Bool
    
    var body: some View {
        Button(action: {
            showStatistics.toggle()
        }) {
            Image("3dot")
                .padding()
                .background(.clear)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
