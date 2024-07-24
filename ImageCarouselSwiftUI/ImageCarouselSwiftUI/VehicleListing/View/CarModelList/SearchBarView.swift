//
//  SearchBarView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 23/07/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search car here", text: $searchText)
                .padding(5)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 1)
                .shadow(color: .black, radius: 4, x: 0, y: 2)
        }
        .frame(height: 44)
    }
}
